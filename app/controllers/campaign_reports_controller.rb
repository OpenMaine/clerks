require 'roo'
require 'chronic'

class CampaignReportsController < ApplicationController
  before_action :set_campaign_report, only: %i[ show edit update destroy ]

  # GET /campaign_reports or /campaign_reports.json
  def index
    @campaign_reports = CampaignReport.all.order('report_type')
    @campaign = Campaign.find(params[:campaign_id])
  end

  # GET /campaign_reports/1 or /campaign_reports/1.json
  def show
  end

  # GET /campaign_reports/new
  def new
    @campaign_report = CampaignReport.new
  end

  # GET /campaign_reports/1/edit
  def edit
  end

  # POST /campaign_reports or /campaign_reports.json
  def create
    # grab the file object
    spreadsheet = params[:spreadsheet]

    # parse the file object in Roo (should only ever be xlsx)
    ss = Roo::Spreadsheet.open(params[:spreadsheet], extension: :xlsx)

    # grab relevant campaign 
    campaign = Campaign.find(params[:campaign_id])

    # build campaign report using that campaign
    report = campaign.campaign_reports.build

    # pull office type from sheet and save report
    report.report_type = ss.sheet(0).row(2)[8]
    report.save

    # Start iterating through and storing each row of the schedule A
    ss.sheet(1).parse(headers: true).each do |row|
      if row["Amount"] != "Amount"
        a = report.campaign_schedule_as.build
        a.date = Chronic.parse(row["Date Received"])
        a.name = row["Contributor Name"]
        a.address = row["Address"]
        a.city = row["City"]
        a.state = row["State"]
        a.zip = row["Zip"]
        a.occupation = row["Occupation"]
        a.schedule_a_type = row["Type"]

        # Here we are converting the dollar amount into integer to track
        # by pennies. First we convert the float to a string with a guaranteed
        # mantissa of two digits. This ensures we have pennies. Then we remove
        # the decimal from the string and convert to integer. This helps us
        # avoid float math errors later on
        a.amount = Integer(("%.2f" % row["Amount"]).sub(".","")) if row["Amount"] != nil
        a.save
      end
    end

    # Start iterating through and storing each row of the schedule A1's
    # A1's are essentially A's but with a description (for in kind goods)
    ss.sheet(2).parse().each do |row|
      a1 = report.campaign_schedule_a1s.build
      a1.date = Chronic.parse(row["Date Received"])
      a1.name = row[1]
      a1.address = row[2]
      a1.city = row[3]
      a1.state = row[4]
      a1.zip = row[5]
      a1.occupation = row[6]
      a1.employer = row[7]
      a1.schedule_a1_type = row[8]
      a1.amount = process_money(row[9])
      a1.description = row[10]
      a1.save
    end

    # Start iterating through and storing each row of the schedule B's
    ss.sheet(3).parse().each do |row|
      b = report.campaign_schedule_bs.build
      b.date = Chronic.parse(row[0])
      b.payee = row[1]
      b.schedule_b_type = row[2]
      b.description = row[3]
      b.amount = process_money(row[4])
      b.save
    end

    # Start iterating through and storing each row of the schedule C's
    ss.sheet(4).parse().each do |row|
      c = report.campaign_schedule_cs.build
      c.lender = row[0]
      c.balance_at_beginning = process_money(row[1]) if row[1] != nil 
      c.amount_loaned = process_money(row[2]) if row[2] != nil
      c.amount_repaid = process_money(row[3]) if row[3] != nil
      c.amount_forgiven = process_money(row[4]) if row[4] != nil
      c.balance = process_money(row[5]) if row[5] != nil
      c.save
    end

    # Start iterating through and storing each row of the schedule D's
    ss.sheet(5).parse().each do |row|
      d = report.campaign_schedule_ds.build
      d.date = Chronic.parse(row[0])
      d.creditor = row[1]
      d.purpose = row[5]
      d.amount = process_money(row[6])
      d.save
    end

    # There should only be one row for a schedule F
    if ss.sheet(6).row(1)[1] != nil
      f = report.build_campaign_schedule_f
      row = ss.sheet(6).parse(headers: true)[1]
      f.receipts = process_money(row["Total Receipts"]) if row["Total Receipts"] != nil
      f.payments = process_money(row["Total Payments"]) if row["Total Payments"] != nil
      f.balance  = process_money(row["Cash Balance"]) if row["Cash Balance"] != nil
      f.save
    end

    redirect_to [campaign, report]
  end

  # PATCH/PUT /campaign_reports/1 or /campaign_reports/1.json
  def update
    respond_to do |format|
      if @campaign_report.update(campaign_report_params)
        format.html { redirect_to campaign_report_url(@campaign_report), notice: "Campaign report was successfully updated." }
        format.json { render :show, status: :ok, location: @campaign_report }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_reports/1 or /campaign_reports/1.json
  def destroy
    campaign = @campaign_report.campaign
    CampaignScheduleA.where(campaign_report_id: @campaign_report.id).destroy_all
    CampaignScheduleA1.where(campaign_report_id: @campaign_report.id).destroy_all
    CampaignScheduleB.where(campaign_report_id: @campaign_report.id).destroy_all
    CampaignScheduleC.where(campaign_report_id: @campaign_report.id).destroy_all
    CampaignScheduleD.where(campaign_report_id: @campaign_report.id).destroy_all
    CampaignScheduleF.where(campaign_report_id: @campaign_report.id).destroy_all
    @campaign_report.destroy

    respond_to do |format|
      format.html { redirect_to campaign, notice: "Campaign report was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def download_campaign_xlsx
    send_file "#{Rails.root}/app/assets/files/CampaignReport.xlsx", type: "application/xlsx", x_sendfile: true
  end

  def download_campaign_csv
    send_file "#{Rails.root}/app/assets/files/CampaignReport.csv", type: "application/csv", x_sendfile: true
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_report
      @campaign_report = CampaignReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_report_params
      params.require(:campaign_report).permit(:campaign_id, :type)
    end

    # Process money that comes in to us as a float/double
    def process_money(amt)
      # Here we are converting the dollar amount into integer to track
      # by pennies. First we convert the float to a string with a guaranteed
      # mantissa of two digits. This ensures we have pennies. Then we remove
      # the decimal from the string and convert to integer. This helps us
      # avoid float math errors later on
      Integer(("%.2f" % amt).sub(".",""))
    end
end
