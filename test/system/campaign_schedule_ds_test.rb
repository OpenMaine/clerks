require "application_system_test_case"

class CampaignScheduleDsTest < ApplicationSystemTestCase
  setup do
    @campaign_schedule_d = campaign_schedule_ds(:one)
  end

  test "visiting the index" do
    visit campaign_schedule_ds_url
    assert_selector "h1", text: "Campaign schedule ds"
  end

  test "should create campaign schedule d" do
    visit campaign_schedule_ds_url
    click_on "New campaign schedule d"

    fill_in "Amount", with: @campaign_schedule_d.amount
    fill_in "Campaign", with: @campaign_schedule_d.campaign_id
    fill_in "Creditor", with: @campaign_schedule_d.creditor
    fill_in "Date", with: @campaign_schedule_d.date
    fill_in "Purpose", with: @campaign_schedule_d.purpose
    click_on "Create Campaign schedule d"

    assert_text "Campaign schedule d was successfully created"
    click_on "Back"
  end

  test "should update Campaign schedule d" do
    visit campaign_schedule_d_url(@campaign_schedule_d)
    click_on "Edit this campaign schedule d", match: :first

    fill_in "Amount", with: @campaign_schedule_d.amount
    fill_in "Campaign", with: @campaign_schedule_d.campaign_id
    fill_in "Creditor", with: @campaign_schedule_d.creditor
    fill_in "Date", with: @campaign_schedule_d.date
    fill_in "Purpose", with: @campaign_schedule_d.purpose
    click_on "Update Campaign schedule d"

    assert_text "Campaign schedule d was successfully updated"
    click_on "Back"
  end

  test "should destroy Campaign schedule d" do
    visit campaign_schedule_d_url(@campaign_schedule_d)
    click_on "Destroy this campaign schedule d", match: :first

    assert_text "Campaign schedule d was successfully destroyed"
  end
end
