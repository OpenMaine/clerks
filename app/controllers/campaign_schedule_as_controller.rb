class CampaignScheduleAsController < ApplicationController
  before_action :set_campaign_schedule_a, only: %i[ show edit update destroy ]

  # GET /campaign_schedule_as or /campaign_schedule_as.json
  def index
    @campaign_schedule_as = CampaignScheduleA.all
  end

  # GET /campaign_schedule_as/1 or /campaign_schedule_as/1.json
  def show
  end

  # GET /campaign_schedule_as/new
  def new
    @campaign_schedule_a = CampaignScheduleA.new
  end

  # GET /campaign_schedule_as/1/edit
  def edit
  end

  # POST /campaign_schedule_as or /campaign_schedule_as.json
  def create
    @campaign_schedule_a = CampaignScheduleA.new(campaign_schedule_a_params)

    respond_to do |format|
      if @campaign_schedule_a.save
        format.html { redirect_to campaign_schedule_a_url(@campaign_schedule_a), notice: "Campaign schedule a was successfully created." }
        format.json { render :show, status: :created, location: @campaign_schedule_a }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campaign_schedule_a.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign_schedule_as/1 or /campaign_schedule_as/1.json
  def update
    respond_to do |format|
      if @campaign_schedule_a.update(campaign_schedule_a_params)
        format.html { redirect_to campaign_schedule_a_url(@campaign_schedule_a), notice: "Campaign schedule a was successfully updated." }
        format.json { render :show, status: :ok, location: @campaign_schedule_a }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign_schedule_a.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_schedule_as/1 or /campaign_schedule_as/1.json
  def destroy
    @campaign_schedule_a.destroy

    respond_to do |format|
      format.html { redirect_to campaign_schedule_as_url, notice: "Campaign schedule a was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_schedule_a
      @campaign_schedule_a = CampaignScheduleA.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_schedule_a_params
      params.require(:campaign_schedule_a).permit(:campaign_id, :date, :name, :address, :city, :state, :zip, :occupation, :employer, :type, :amount, :description)
    end
end
