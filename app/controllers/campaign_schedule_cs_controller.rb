class CampaignScheduleCsController < ApplicationController
  before_action :set_campaign_schedule_c, only: %i[ show edit update destroy ]

  # GET /campaign_schedule_cs or /campaign_schedule_cs.json
  def index
    @campaign_schedule_cs = CampaignScheduleC.all
  end

  # GET /campaign_schedule_cs/1 or /campaign_schedule_cs/1.json
  def show
  end

  # GET /campaign_schedule_cs/new
  def new
    @campaign_schedule_c = CampaignScheduleC.new
  end

  # GET /campaign_schedule_cs/1/edit
  def edit
  end

  # POST /campaign_schedule_cs or /campaign_schedule_cs.json
  def create
    @campaign_schedule_c = CampaignScheduleC.new(campaign_schedule_c_params)

    respond_to do |format|
      if @campaign_schedule_c.save
        format.html { redirect_to campaign_schedule_c_url(@campaign_schedule_c), notice: "Campaign schedule c was successfully created." }
        format.json { render :show, status: :created, location: @campaign_schedule_c }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campaign_schedule_c.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign_schedule_cs/1 or /campaign_schedule_cs/1.json
  def update
    respond_to do |format|
      if @campaign_schedule_c.update(campaign_schedule_c_params)
        format.html { redirect_to campaign_schedule_c_url(@campaign_schedule_c), notice: "Campaign schedule c was successfully updated." }
        format.json { render :show, status: :ok, location: @campaign_schedule_c }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign_schedule_c.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_schedule_cs/1 or /campaign_schedule_cs/1.json
  def destroy
    @campaign_schedule_c.destroy

    respond_to do |format|
      format.html { redirect_to campaign_schedule_cs_url, notice: "Campaign schedule c was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_schedule_c
      @campaign_schedule_c = CampaignScheduleC.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_schedule_c_params
      params.require(:campaign_schedule_c).permit(:campaign_id, :lender, :balance_at_beginning, :amount_loaned, :amount_repaid, :amount_forgiven, :balance)
    end
end
