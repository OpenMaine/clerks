require "test_helper"

class CampaignTreasurersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_treasurer = campaign_treasurers(:one)
  end

  test "should get index" do
    get campaign_treasurers_url
    assert_response :success
  end

  test "should get new" do
    get new_campaign_treasurer_url
    assert_response :success
  end

  test "should create campaign_treasurer" do
    assert_difference("CampaignTreasurer.count") do
      post campaign_treasurers_url, params: { campaign_treasurer: { address: @campaign_treasurer.address, campaign_id: @campaign_treasurer.campaign_id, city: @campaign_treasurer.city, email: @campaign_treasurer.email, name: @campaign_treasurer.name, telephone: @campaign_treasurer.telephone } }
    end

    assert_redirected_to campaign_treasurer_url(CampaignTreasurer.last)
  end

  test "should show campaign_treasurer" do
    get campaign_treasurer_url(@campaign_treasurer)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_treasurer_url(@campaign_treasurer)
    assert_response :success
  end

  test "should update campaign_treasurer" do
    patch campaign_treasurer_url(@campaign_treasurer), params: { campaign_treasurer: { address: @campaign_treasurer.address, campaign_id: @campaign_treasurer.campaign_id, city: @campaign_treasurer.city, email: @campaign_treasurer.email, name: @campaign_treasurer.name, telephone: @campaign_treasurer.telephone } }
    assert_redirected_to campaign_treasurer_url(@campaign_treasurer)
  end

  test "should destroy campaign_treasurer" do
    assert_difference("CampaignTreasurer.count", -1) do
      delete campaign_treasurer_url(@campaign_treasurer)
    end

    assert_redirected_to campaign_treasurers_url
  end
end
