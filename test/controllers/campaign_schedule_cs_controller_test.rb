require "test_helper"

class CampaignScheduleCsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_schedule_c = campaign_schedule_cs(:one)
  end

  test "should get index" do
    get campaign_schedule_cs_url
    assert_response :success
  end

  test "should get new" do
    get new_campaign_schedule_c_url
    assert_response :success
  end

  test "should create campaign_schedule_c" do
    assert_difference("CampaignScheduleC.count") do
      post campaign_schedule_cs_url, params: { campaign_schedule_c: { amount_forgiven: @campaign_schedule_c.amount_forgiven, amount_loaned: @campaign_schedule_c.amount_loaned, amount_repaid: @campaign_schedule_c.amount_repaid, balance: @campaign_schedule_c.balance, balance_at_beginning: @campaign_schedule_c.balance_at_beginning, campaign_id: @campaign_schedule_c.campaign_id, lender: @campaign_schedule_c.lender } }
    end

    assert_redirected_to campaign_schedule_c_url(CampaignScheduleC.last)
  end

  test "should show campaign_schedule_c" do
    get campaign_schedule_c_url(@campaign_schedule_c)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_schedule_c_url(@campaign_schedule_c)
    assert_response :success
  end

  test "should update campaign_schedule_c" do
    patch campaign_schedule_c_url(@campaign_schedule_c), params: { campaign_schedule_c: { amount_forgiven: @campaign_schedule_c.amount_forgiven, amount_loaned: @campaign_schedule_c.amount_loaned, amount_repaid: @campaign_schedule_c.amount_repaid, balance: @campaign_schedule_c.balance, balance_at_beginning: @campaign_schedule_c.balance_at_beginning, campaign_id: @campaign_schedule_c.campaign_id, lender: @campaign_schedule_c.lender } }
    assert_redirected_to campaign_schedule_c_url(@campaign_schedule_c)
  end

  test "should destroy campaign_schedule_c" do
    assert_difference("CampaignScheduleC.count", -1) do
      delete campaign_schedule_c_url(@campaign_schedule_c)
    end

    assert_redirected_to campaign_schedule_cs_url
  end
end
