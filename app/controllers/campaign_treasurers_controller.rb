class CampaignTreasurersController < ApplicationController
  before_action :set_campaign_treasurer, only: %i[ show edit update destroy ]

  # GET /campaign_treasurers or /campaign_treasurers.json
  def index
    @campaign_treasurers = CampaignTreasurer.all
  end

  # GET /campaign_treasurers/1 or /campaign_treasurers/1.json
  def show
  end

  # GET /campaign_treasurers/new
  def new
    @campaign_treasurer = CampaignTreasurer.new
  end

  # GET /campaign_treasurers/1/edit
  def edit
  end

  # POST /campaign_treasurers or /campaign_treasurers.json
  def create
    @campaign_treasurer = CampaignTreasurer.new(campaign_treasurer_params)

    respond_to do |format|
      if @campaign_treasurer.save
        format.html { redirect_to campaign_treasurer_url(@campaign_treasurer), notice: "Campaign treasurer was successfully created." }
        format.json { render :show, status: :created, location: @campaign_treasurer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @campaign_treasurer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /campaign_treasurers/1 or /campaign_treasurers/1.json
  def update
    respond_to do |format|
      if @campaign_treasurer.update(campaign_treasurer_params)
        format.html { redirect_to campaign_treasurer_url(@campaign_treasurer), notice: "Campaign treasurer was successfully updated." }
        format.json { render :show, status: :ok, location: @campaign_treasurer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @campaign_treasurer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /campaign_treasurers/1 or /campaign_treasurers/1.json
  def destroy
    @campaign_treasurer.destroy

    respond_to do |format|
      format.html { redirect_to campaign_treasurers_url, notice: "Campaign treasurer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_campaign_treasurer
      @campaign_treasurer = CampaignTreasurer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def campaign_treasurer_params
      params.require(:campaign_treasurer).permit(:campaign_id, :name, :address, :city, :email, :telephone)
    end
end
