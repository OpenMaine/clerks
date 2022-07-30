class CampaignScheduleBsController < ApplicationController
  before_action :set_campaign_schedule_b, only: %i[ show edit update destroy ]

  # GET /campaign_schedule_bs or /campaign_schedule_bs.json
  def index
    @campaign_schedule_bs = CampaignScheduleB.all
  end

  # GET /campaign_schedule_bs/1 or /campaign_schedule_bs/1.json
  def show
  end

  # GET /campaign_schedule_bs/new
  def new
    @campaign_schedule_b = CampaignScheduleB.new
  end

  # GET /campaign_schedule_bs/1/edit
  def edit
  end

  # POST /campaign_schedule_bs or /campaign_schedule_bs.json
  def create
    @campaign_schedule_b = CampaignScheduleB.new(campaign_schedule_b_params)

    respond_to do |format|
      if @campaign_schedule_b.save
        format.html { redirect_to campaign_schedule_b_url(@campaign_schedule_b), notice: "Campaign schedule b was successfully created." }
        format.json { render :show, status: :created, location: @campaign_schedule_b }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campaign_schedule_b.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign_schedule_bs/1 or /campaign_schedule_bs/1.json
  def update
    respond_to do |format|
      if @campaign_schedule_b.update(campaign_schedule_b_params)
        format.html { redirect_to campaign_schedule_b_url(@campaign_schedule_b), notice: "Campaign schedule b was successfully updated." }
        format.json { render :show, status: :ok, location: @campaign_schedule_b }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign_schedule_b.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_schedule_bs/1 or /campaign_schedule_bs/1.json
  def destroy
    @campaign_schedule_b.destroy

    respond_to do |format|
      format.html { redirect_to campaign_schedule_bs_url, notice: "Campaign schedule b was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_schedule_b
      @campaign_schedule_b = CampaignScheduleB.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_schedule_b_params
      params.require(:campaign_schedule_b).permit(:campaign_id, :date, :payee, :type, :description, :amount)
    end
end
