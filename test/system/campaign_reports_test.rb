require "application_system_test_case"

class CampaignReportsTest < ApplicationSystemTestCase
  setup do
    @campaign_report = campaign_reports(:one)
  end

  test "visiting the index" do
    visit campaign_reports_url
    assert_selector "h1", text: "Campaign reports"
  end

  test "should create campaign report" do
    visit campaign_reports_url
    click_on "New campaign report"

    fill_in "Campaign", with: @campaign_report.campaign_id
    fill_in "Type", with: @campaign_report.type
    click_on "Create Campaign report"

    assert_text "Campaign report was successfully created"
    click_on "Back"
  end

  test "should update Campaign report" do
    visit campaign_report_url(@campaign_report)
    click_on "Edit this campaign report", match: :first

    fill_in "Campaign", with: @campaign_report.campaign_id
    fill_in "Type", with: @campaign_report.type
    click_on "Update Campaign report"

    assert_text "Campaign report was successfully updated"
    click_on "Back"
  end

  test "should destroy Campaign report" do
    visit campaign_report_url(@campaign_report)
    click_on "Destroy this campaign report", match: :first

    assert_text "Campaign report was successfully destroyed"
  end
end
