class CampaignScheduleFsController < ApplicationController
  include CampaignReportSchedule
  before_action :set_campaign_schedule_f, only: %i[ show edit update destroy ]

  # GET /campaign_schedule_fs or /campaign_schedule_fs.json
  def index
    @campaign_schedule_f = @campaign_report.campaign_schedule_f
  end

  # GET /campaign_schedule_fs/1 or /campaign_schedule_fs/1.json
  def show
  end

  # GET /campaign_schedule_fs/new
  def new
    @campaign_schedule_f = CampaignScheduleF.new
  end

  # GET /campaign_schedule_fs/1/edit
  def edit
  end

  # POST /campaign_schedule_fs or /campaign_schedule_fs.json
  def create
    @campaign_schedule_f = CampaignScheduleF.new(campaign_schedule_f_params)

    respond_to do |format|
      if @campaign_schedule_f.save
        format.html { redirect_to campaign_schedule_f_url(@campaign_schedule_f), notice: "Campaign schedule f was successfully created." }
        format.json { render :show, status: :created, location: @campaign_schedule_f }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campaign_schedule_f.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign_schedule_fs/1 or /campaign_schedule_fs/1.json
  def update
    respond_to do |format|
      if @campaign_schedule_f.update(campaign_schedule_f_params)
        format.html { redirect_to campaign_schedule_f_url(@campaign_schedule_f), notice: "Campaign schedule f was successfully updated." }
        format.json { render :show, status: :ok, location: @campaign_schedule_f }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign_schedule_f.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_schedule_fs/1 or /campaign_schedule_fs/1.json
  def destroy
    @campaign_schedule_f.destroy

    respond_to do |format|
      format.html { redirect_to campaign_schedule_fs_url, notice: "Campaign schedule f was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_schedule_f
      @campaign_schedule_f = CampaignScheduleF.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_schedule_f_params
      params.require(:campaign_schedule_f).permit(:campaign_id, :receipts, :payments, :balance)
    end
end
