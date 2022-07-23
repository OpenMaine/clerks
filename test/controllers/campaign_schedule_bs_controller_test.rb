require "test_helper"

class CampaignScheduleBsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_schedule_b = campaign_schedule_bs(:one)
  end

  test "should get index" do
    get campaign_schedule_bs_url
    assert_response :success
  end

  test "should get new" do
    get new_campaign_schedule_b_url
    assert_response :success
  end

  test "should create campaign_schedule_b" do
    assert_difference("CampaignScheduleB.count") do
      post campaign_schedule_bs_url, params: { campaign_schedule_b: { amount: @campaign_schedule_b.amount, campaign_id: @campaign_schedule_b.campaign_id, date: @campaign_schedule_b.date, description: @campaign_schedule_b.description, payee: @campaign_schedule_b.payee, type: @campaign_schedule_b.type } }
    end

    assert_redirected_to campaign_schedule_b_url(CampaignScheduleB.last)
  end

  test "should show campaign_schedule_b" do
    get campaign_schedule_b_url(@campaign_schedule_b)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_schedule_b_url(@campaign_schedule_b)
    assert_response :success
  end

  test "should update campaign_schedule_b" do
    patch campaign_schedule_b_url(@campaign_schedule_b), params: { campaign_schedule_b: { amount: @campaign_schedule_b.amount, campaign_id: @campaign_schedule_b.campaign_id, date: @campaign_schedule_b.date, description: @campaign_schedule_b.description, payee: @campaign_schedule_b.payee, type: @campaign_schedule_b.type } }
    assert_redirected_to campaign_schedule_b_url(@campaign_schedule_b)
  end

  test "should destroy campaign_schedule_b" do
    assert_difference("CampaignScheduleB.count", -1) do
      delete campaign_schedule_b_url(@campaign_schedule_b)
    end

    assert_redirected_to campaign_schedule_bs_url
  end
end
