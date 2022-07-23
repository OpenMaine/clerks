require "application_system_test_case"

class CampaignScheduleAsTest < ApplicationSystemTestCase
  setup do
    @campaign_schedule_a = campaign_schedule_as(:one)
  end

  test "visiting the index" do
    visit campaign_schedule_as_url
    assert_selector "h1", text: "Campaign schedule as"
  end

  test "should create campaign schedule a" do
    visit campaign_schedule_as_url
    click_on "New campaign schedule a"

    fill_in "Address", with: @campaign_schedule_a.address
    fill_in "Amount", with: @campaign_schedule_a.amount
    fill_in "Campaign", with: @campaign_schedule_a.campaign_id
    fill_in "City", with: @campaign_schedule_a.city
    fill_in "Date", with: @campaign_schedule_a.date
    fill_in "Description", with: @campaign_schedule_a.description
    fill_in "Employer", with: @campaign_schedule_a.employer
    fill_in "Name", with: @campaign_schedule_a.name
    fill_in "Occupation", with: @campaign_schedule_a.occupation
    fill_in "State", with: @campaign_schedule_a.state
    fill_in "Type", with: @campaign_schedule_a.type
    fill_in "Zip", with: @campaign_schedule_a.zip
    click_on "Create Campaign schedule a"

    assert_text "Campaign schedule a was successfully created"
    click_on "Back"
  end

  test "should update Campaign schedule a" do
    visit campaign_schedule_a_url(@campaign_schedule_a)
    click_on "Edit this campaign schedule a", match: :first

    fill_in "Address", with: @campaign_schedule_a.address
    fill_in "Amount", with: @campaign_schedule_a.amount
    fill_in "Campaign", with: @campaign_schedule_a.campaign_id
    fill_in "City", with: @campaign_schedule_a.city
    fill_in "Date", with: @campaign_schedule_a.date
    fill_in "Description", with: @campaign_schedule_a.description
    fill_in "Employer", with: @campaign_schedule_a.employer
    fill_in "Name", with: @campaign_schedule_a.name
    fill_in "Occupation", with: @campaign_schedule_a.occupation
    fill_in "State", with: @campaign_schedule_a.state
    fill_in "Type", with: @campaign_schedule_a.type
    fill_in "Zip", with: @campaign_schedule_a.zip
    click_on "Update Campaign schedule a"

    assert_text "Campaign schedule a was successfully updated"
    click_on "Back"
  end

  test "should destroy Campaign schedule a" do
    visit campaign_schedule_a_url(@campaign_schedule_a)
    click_on "Destroy this campaign schedule a", match: :first

    assert_text "Campaign schedule a was successfully destroyed"
  end
end
