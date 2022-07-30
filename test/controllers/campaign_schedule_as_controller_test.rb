require "test_helper"

class CampaignScheduleAsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_schedule_a = campaign_schedule_as(:one)
  end

  test "should get index" do
    get campaign_schedule_as_url
    assert_response :success
  end

  test "should get new" do
    get new_campaign_schedule_a_url
    assert_response :success
  end

  test "should create campaign_schedule_a" do
    assert_difference("CampaignScheduleA.count") do
      post campaign_schedule_as_url, params: { campaign_schedule_a: { address: @campaign_schedule_a.address, amount: @campaign_schedule_a.amount, campaign_id: @campaign_schedule_a.campaign_id, city: @campaign_schedule_a.city, date: @campaign_schedule_a.date, description: @campaign_schedule_a.description, employer: @campaign_schedule_a.employer, name: @campaign_schedule_a.name, occupation: @campaign_schedule_a.occupation, state: @campaign_schedule_a.state, type: @campaign_schedule_a.type, zip: @campaign_schedule_a.zip } }
    end

    assert_redirected_to campaign_schedule_a_url(CampaignScheduleA.last)
  end

  test "should show campaign_schedule_a" do
    get campaign_schedule_a_url(@campaign_schedule_a)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_schedule_a_url(@campaign_schedule_a)
    assert_response :success
  end

  test "should update campaign_schedule_a" do
    patch campaign_schedule_a_url(@campaign_schedule_a), params: { campaign_schedule_a: { address: @campaign_schedule_a.address, amount: @campaign_schedule_a.amount, campaign_id: @campaign_schedule_a.campaign_id, city: @campaign_schedule_a.city, date: @campaign_schedule_a.date, description: @campaign_schedule_a.description, employer: @campaign_schedule_a.employer, name: @campaign_schedule_a.name, occupation: @campaign_schedule_a.occupation, state: @campaign_schedule_a.state, type: @campaign_schedule_a.type, zip: @campaign_schedule_a.zip } }
    assert_redirected_to campaign_schedule_a_url(@campaign_schedule_a)
  end

  test "should destroy campaign_schedule_a" do
    assert_difference("CampaignScheduleA.count", -1) do
      delete campaign_schedule_a_url(@campaign_schedule_a)
    end

    assert_redirected_to campaign_schedule_as_url
  end
end
