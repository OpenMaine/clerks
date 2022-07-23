require "test_helper"

class CampaignScheduleDsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_schedule_d = campaign_schedule_ds(:one)
  end

  test "should get index" do
    get campaign_schedule_ds_url
    assert_response :success
  end

  test "should get new" do
    get new_campaign_schedule_d_url
    assert_response :success
  end

  test "should create campaign_schedule_d" do
    assert_difference("CampaignScheduleD.count") do
      post campaign_schedule_ds_url, params: { campaign_schedule_d: { amount: @campaign_schedule_d.amount, campaign_id: @campaign_schedule_d.campaign_id, creditor: @campaign_schedule_d.creditor, date: @campaign_schedule_d.date, purpose: @campaign_schedule_d.purpose } }
    end

    assert_redirected_to campaign_schedule_d_url(CampaignScheduleD.last)
  end

  test "should show campaign_schedule_d" do
    get campaign_schedule_d_url(@campaign_schedule_d)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_schedule_d_url(@campaign_schedule_d)
    assert_response :success
  end

  test "should update campaign_schedule_d" do
    patch campaign_schedule_d_url(@campaign_schedule_d), params: { campaign_schedule_d: { amount: @campaign_schedule_d.amount, campaign_id: @campaign_schedule_d.campaign_id, creditor: @campaign_schedule_d.creditor, date: @campaign_schedule_d.date, purpose: @campaign_schedule_d.purpose } }
    assert_redirected_to campaign_schedule_d_url(@campaign_schedule_d)
  end

  test "should destroy campaign_schedule_d" do
    assert_difference("CampaignScheduleD.count", -1) do
      delete campaign_schedule_d_url(@campaign_schedule_d)
    end

    assert_redirected_to campaign_schedule_ds_url
  end
end
