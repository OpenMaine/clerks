require "test_helper"

class CampaignScheduleFsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_schedule_f = campaign_schedule_fs(:one)
  end

  test "should get index" do
    get campaign_schedule_fs_url
    assert_response :success
  end

  test "should get new" do
    get new_campaign_schedule_f_url
    assert_response :success
  end

  test "should create campaign_schedule_f" do
    assert_difference("CampaignScheduleF.count") do
      post campaign_schedule_fs_url, params: { campaign_schedule_f: { balance: @campaign_schedule_f.balance, campaign_id: @campaign_schedule_f.campaign_id, payments: @campaign_schedule_f.payments, receipts: @campaign_schedule_f.receipts } }
    end

    assert_redirected_to campaign_schedule_f_url(CampaignScheduleF.last)
  end

  test "should show campaign_schedule_f" do
    get campaign_schedule_f_url(@campaign_schedule_f)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_schedule_f_url(@campaign_schedule_f)
    assert_response :success
  end

  test "should update campaign_schedule_f" do
    patch campaign_schedule_f_url(@campaign_schedule_f), params: { campaign_schedule_f: { balance: @campaign_schedule_f.balance, campaign_id: @campaign_schedule_f.campaign_id, payments: @campaign_schedule_f.payments, receipts: @campaign_schedule_f.receipts } }
    assert_redirected_to campaign_schedule_f_url(@campaign_schedule_f)
  end

  test "should destroy campaign_schedule_f" do
    assert_difference("CampaignScheduleF.count", -1) do
      delete campaign_schedule_f_url(@campaign_schedule_f)
    end

    assert_redirected_to campaign_schedule_fs_url
  end
end
