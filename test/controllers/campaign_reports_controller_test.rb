require "test_helper"

class CampaignReportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign_report = campaign_reports(:one)
  end

  test "should get index" do
    get campaign_reports_url
    assert_response :success
  end

  test "should get new" do
    get new_campaign_report_url
    assert_response :success
  end

  test "should create campaign_report" do
    assert_difference("CampaignReport.count") do
      post campaign_reports_url, params: { campaign_report: { campaign_id: @campaign_report.campaign_id, type: @campaign_report.type } }
    end

    assert_redirected_to campaign_report_url(CampaignReport.last)
  end

  test "should show campaign_report" do
    get campaign_report_url(@campaign_report)
    assert_response :success
  end

  test "should get edit" do
    get edit_campaign_report_url(@campaign_report)
    assert_response :success
  end

  test "should update campaign_report" do
    patch campaign_report_url(@campaign_report), params: { campaign_report: { campaign_id: @campaign_report.campaign_id, type: @campaign_report.type } }
    assert_redirected_to campaign_report_url(@campaign_report)
  end

  test "should destroy campaign_report" do
    assert_difference("CampaignReport.count", -1) do
      delete campaign_report_url(@campaign_report)
    end

    assert_redirected_to campaign_reports_url
  end
end
