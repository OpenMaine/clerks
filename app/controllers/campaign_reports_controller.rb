require 'roo'

class CampaignReportsController < ApplicationController
  before_action :set_campaign_report, only: %i[ show edit update destroy ]

  # GET /campaign_reports or /campaign_reports.json
  def index
    @campaign_reports = CampaignReport.all
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
    spreadsheet = params[:spreadsheet]
    ss = Roo::Spreadsheet.open(params[:spreadsheet], extension: :xlsx)
    campaign = Campaign.find(params[:campaign_id])
    report = campaign.campaign_reports.build
    report.report_type = ss.sheet(0).row(2)[7]
    report.save
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
    @campaign_report.destroy

    respond_to do |format|
      format.html { redirect_to campaign, notice: "Campaign report was successfully destroyed." }
      format.json { head :no_content }
    end
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
end
