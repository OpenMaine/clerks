class CampaignScheduleA1sController < ApplicationController
  include CampaignReportSchedule
  before_action :set_campaign_schedule_a1, only: %i[ show edit update destroy ]

  # GET /campaign_schedule_a1s or /campaign_schedule_a1s.json
  def index
    @campaign_schedule_a1s = @campaign_report.campaign_schedule_a1s
  end

  # GET /campaign_schedule_a1s/1 or /campaign_schedule_a1s/1.json
  def show
  end

  # GET /campaign_schedule_a1s/new
  def new
    @campaign_schedule_a1 = CampaignScheduleA1.new
  end

  # GET /campaign_schedule_a1s/1/edit
  def edit
  end

  # POST /campaign_schedule_a1s or /campaign_schedule_a1s.json
  def create
    @campaign_schedule_a1 = CampaignScheduleA1.new(campaign_schedule_a1_params)

    respond_to do |format|
      if @campaign_schedule_a1.save
        format.html { redirect_to campaign_schedule_a1_url(@campaign_schedule_a1), notice: "Campaign schedule a1 was successfully created." }
        format.json { render :show, status: :created, location: @campaign_schedule_a1 }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campaign_schedule_a1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign_schedule_a1s/1 or /campaign_schedule_a1s/1.json
  def update
    respond_to do |format|
      if @campaign_schedule_a1.update(campaign_schedule_a1_params)
        format.html { redirect_to campaign_schedule_a1_url(@campaign_schedule_a1), notice: "Campaign schedule a1 was successfully updated." }
        format.json { render :show, status: :ok, location: @campaign_schedule_a1 }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign_schedule_a1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_schedule_a1s/1 or /campaign_schedule_a1s/1.json
  def destroy
    @campaign_schedule_a1.destroy

    respond_to do |format|
      format.html { redirect_to campaign_schedule_a1s_url, notice: "Campaign schedule a1 was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_schedule_a1
      @campaign_schedule_a1 = CampaignScheduleA1.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_schedule_a1_params
      params.require(:campaign_schedule_a1).permit(:campaign_report_id, :date, :name, :address, :city, :state, :zip, :occupation, :employer, :schedule_a1_type, :amount, :description)
    end
end
