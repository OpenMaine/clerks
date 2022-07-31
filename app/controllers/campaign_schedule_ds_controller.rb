class CampaignScheduleDsController < ApplicationController
  include CampaignReportSchedule
  before_action :set_campaign_schedule_d, only: %i[ show edit update destroy ]

  # GET /campaign_schedule_ds or /campaign_schedule_ds.json
  def index
    @campaign_schedule_ds = @campaign_report.campaign_schedule_ds
  end

  # GET /campaign_schedule_ds/1 or /campaign_schedule_ds/1.json
  def show
  end

  # GET /campaign_schedule_ds/new
  def new
    @campaign_schedule_d = CampaignScheduleD.new
  end

  # GET /campaign_schedule_ds/1/edit
  def edit
  end

  # POST /campaign_schedule_ds or /campaign_schedule_ds.json
  def create
    @campaign_schedule_d = CampaignScheduleD.new(campaign_schedule_d_params)

    respond_to do |format|
      if @campaign_schedule_d.save
        format.html { redirect_to campaign_schedule_d_url(@campaign_schedule_d), notice: "Campaign schedule d was successfully created." }
        format.json { render :show, status: :created, location: @campaign_schedule_d }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campaign_schedule_d.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign_schedule_ds/1 or /campaign_schedule_ds/1.json
  def update
    respond_to do |format|
      if @campaign_schedule_d.update(campaign_schedule_d_params)
        format.html { redirect_to campaign_schedule_d_url(@campaign_schedule_d), notice: "Campaign schedule d was successfully updated." }
        format.json { render :show, status: :ok, location: @campaign_schedule_d }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign_schedule_d.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_schedule_ds/1 or /campaign_schedule_ds/1.json
  def destroy
    @campaign_schedule_d.destroy

    respond_to do |format|
      format.html { redirect_to campaign_schedule_ds_url, notice: "Campaign schedule d was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_schedule_d
      @campaign_schedule_d = CampaignScheduleD.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_schedule_d_params
      params.require(:campaign_schedule_d).permit(:date, :creditor, :purpose, :amount, :campaign_id)
    end
end
