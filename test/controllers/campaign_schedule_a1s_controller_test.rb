require "test_helper"

class CampaignScheduleA1sControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_schedule_a1 = campaign_schedule_a1s(:one)
  end

  test "should get index" do
    get campaign_schedule_a1s_url
    assert_response :success
  end

  test "should get new" do
    get new_campaign_schedule_a1_url
    assert_response :success
  end

  test "should create campaign_schedule_a1" do
    assert_difference("CampaignScheduleA1.count") do
      post campaign_schedule_a1s_url, params: { campaign_schedule_a1: { address: @campaign_schedule_a1.address, amount: @campaign_schedule_a1.amount, campaign_report_id: @campaign_schedule_a1.campaign_report_id, city: @campaign_schedule_a1.city, date: @campaign_schedule_a1.date, description: @campaign_schedule_a1.description, employer: @campaign_schedule_a1.employer, name: @campaign_schedule_a1.name, occupation: @campaign_schedule_a1.occupation, schedule_a1_type: @campaign_schedule_a1.schedule_a1_type, state: @campaign_schedule_a1.state, zip: @campaign_schedule_a1.zip } }
    end

    assert_redirected_to campaign_schedule_a1_url(CampaignScheduleA1.last)
  end

  test "should show campaign_schedule_a1" do
    get campaign_schedule_a1_url(@campaign_schedule_a1)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_schedule_a1_url(@campaign_schedule_a1)
    assert_response :success
  end

  test "should update campaign_schedule_a1" do
    patch campaign_schedule_a1_url(@campaign_schedule_a1), params: { campaign_schedule_a1: { address: @campaign_schedule_a1.address, amount: @campaign_schedule_a1.amount, campaign_report_id: @campaign_schedule_a1.campaign_report_id, city: @campaign_schedule_a1.city, date: @campaign_schedule_a1.date, description: @campaign_schedule_a1.description, employer: @campaign_schedule_a1.employer, name: @campaign_schedule_a1.name, occupation: @campaign_schedule_a1.occupation, schedule_a1_type: @campaign_schedule_a1.schedule_a1_type, state: @campaign_schedule_a1.state, zip: @campaign_schedule_a1.zip } }
    assert_redirected_to campaign_schedule_a1_url(@campaign_schedule_a1)
  end

  test "should destroy campaign_schedule_a1" do
    assert_difference("CampaignScheduleA1.count", -1) do
      delete campaign_schedule_a1_url(@campaign_schedule_a1)
    end

    assert_redirected_to campaign_schedule_a1s_url
  end
end
