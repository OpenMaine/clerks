require "application_system_test_case"

class CampaignScheduleA1sTest < ApplicationSystemTestCase
  setup do
    @campaign_schedule_a1 = campaign_schedule_a1s(:one)
  end

  test "visiting the index" do
    visit campaign_schedule_a1s_url
    assert_selector "h1", text: "Campaign schedule a1s"
  end

  test "should create campaign schedule a1" do
    visit campaign_schedule_a1s_url
    click_on "New campaign schedule a1"

    fill_in "Address", with: @campaign_schedule_a1.address
    fill_in "Amount", with: @campaign_schedule_a1.amount
    fill_in "Campaign report", with: @campaign_schedule_a1.campaign_report_id
    fill_in "City", with: @campaign_schedule_a1.city
    fill_in "Date", with: @campaign_schedule_a1.date
    fill_in "Description", with: @campaign_schedule_a1.description
    fill_in "Employer", with: @campaign_schedule_a1.employer
    fill_in "Name", with: @campaign_schedule_a1.name
    fill_in "Occupation", with: @campaign_schedule_a1.occupation
    fill_in "Schedule a1 type", with: @campaign_schedule_a1.schedule_a1_type
    fill_in "State", with: @campaign_schedule_a1.state
    fill_in "Zip", with: @campaign_schedule_a1.zip
    click_on "Create Campaign schedule a1"

    assert_text "Campaign schedule a1 was successfully created"
    click_on "Back"
  end

  test "should update Campaign schedule a1" do
    visit campaign_schedule_a1_url(@campaign_schedule_a1)
    click_on "Edit this campaign schedule a1", match: :first

    fill_in "Address", with: @campaign_schedule_a1.address
    fill_in "Amount", with: @campaign_schedule_a1.amount
    fill_in "Campaign report", with: @campaign_schedule_a1.campaign_report_id
    fill_in "City", with: @campaign_schedule_a1.city
    fill_in "Date", with: @campaign_schedule_a1.date
    fill_in "Description", with: @campaign_schedule_a1.description
    fill_in "Employer", with: @campaign_schedule_a1.employer
    fill_in "Name", with: @campaign_schedule_a1.name
    fill_in "Occupation", with: @campaign_schedule_a1.occupation
    fill_in "Schedule a1 type", with: @campaign_schedule_a1.schedule_a1_type
    fill_in "State", with: @campaign_schedule_a1.state
    fill_in "Zip", with: @campaign_schedule_a1.zip
    click_on "Update Campaign schedule a1"

    assert_text "Campaign schedule a1 was successfully updated"
    click_on "Back"
  end

  test "should destroy Campaign schedule a1" do
    visit campaign_schedule_a1_url(@campaign_schedule_a1)
    click_on "Destroy this campaign schedule a1", match: :first

    assert_text "Campaign schedule a1 was successfully destroyed"
  end
end
