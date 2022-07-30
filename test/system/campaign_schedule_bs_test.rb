require "application_system_test_case"

class CampaignScheduleBsTest < ApplicationSystemTestCase
  setup do
    @campaign_schedule_b = campaign_schedule_bs(:one)
  end

  test "visiting the index" do
    visit campaign_schedule_bs_url
    assert_selector "h1", text: "Campaign schedule bs"
  end

  test "should create campaign schedule b" do
    visit campaign_schedule_bs_url
    click_on "New campaign schedule b"

    fill_in "Amount", with: @campaign_schedule_b.amount
    fill_in "Campaign", with: @campaign_schedule_b.campaign_id
    fill_in "Date", with: @campaign_schedule_b.date
    fill_in "Description", with: @campaign_schedule_b.description
    fill_in "Payee", with: @campaign_schedule_b.payee
    fill_in "Type", with: @campaign_schedule_b.type
    click_on "Create Campaign schedule b"

    assert_text "Campaign schedule b was successfully created"
    click_on "Back"
  end

  test "should update Campaign schedule b" do
    visit campaign_schedule_b_url(@campaign_schedule_b)
    click_on "Edit this campaign schedule b", match: :first

    fill_in "Amount", with: @campaign_schedule_b.amount
    fill_in "Campaign", with: @campaign_schedule_b.campaign_id
    fill_in "Date", with: @campaign_schedule_b.date
    fill_in "Description", with: @campaign_schedule_b.description
    fill_in "Payee", with: @campaign_schedule_b.payee
    fill_in "Type", with: @campaign_schedule_b.type
    click_on "Update Campaign schedule b"

    assert_text "Campaign schedule b was successfully updated"
    click_on "Back"
  end

  test "should destroy Campaign schedule b" do
    visit campaign_schedule_b_url(@campaign_schedule_b)
    click_on "Destroy this campaign schedule b", match: :first

    assert_text "Campaign schedule b was successfully destroyed"
  end
end
