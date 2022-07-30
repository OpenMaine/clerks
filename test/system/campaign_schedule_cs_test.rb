require "application_system_test_case"

class CampaignScheduleCsTest < ApplicationSystemTestCase
  setup do
    @campaign_schedule_c = campaign_schedule_cs(:one)
  end

  test "visiting the index" do
    visit campaign_schedule_cs_url
    assert_selector "h1", text: "Campaign schedule cs"
  end

  test "should create campaign schedule c" do
    visit campaign_schedule_cs_url
    click_on "New campaign schedule c"

    fill_in "Amount forgiven", with: @campaign_schedule_c.amount_forgiven
    fill_in "Amount loaned", with: @campaign_schedule_c.amount_loaned
    fill_in "Amount repaid", with: @campaign_schedule_c.amount_repaid
    fill_in "Balance", with: @campaign_schedule_c.balance
    fill_in "Balance at beginning", with: @campaign_schedule_c.balance_at_beginning
    fill_in "Campaign", with: @campaign_schedule_c.campaign_id
    fill_in "Lender", with: @campaign_schedule_c.lender
    click_on "Create Campaign schedule c"

    assert_text "Campaign schedule c was successfully created"
    click_on "Back"
  end

  test "should update Campaign schedule c" do
    visit campaign_schedule_c_url(@campaign_schedule_c)
    click_on "Edit this campaign schedule c", match: :first

    fill_in "Amount forgiven", with: @campaign_schedule_c.amount_forgiven
    fill_in "Amount loaned", with: @campaign_schedule_c.amount_loaned
    fill_in "Amount repaid", with: @campaign_schedule_c.amount_repaid
    fill_in "Balance", with: @campaign_schedule_c.balance
    fill_in "Balance at beginning", with: @campaign_schedule_c.balance_at_beginning
    fill_in "Campaign", with: @campaign_schedule_c.campaign_id
    fill_in "Lender", with: @campaign_schedule_c.lender
    click_on "Update Campaign schedule c"

    assert_text "Campaign schedule c was successfully updated"
    click_on "Back"
  end

  test "should destroy Campaign schedule c" do
    visit campaign_schedule_c_url(@campaign_schedule_c)
    click_on "Destroy this campaign schedule c", match: :first

    assert_text "Campaign schedule c was successfully destroyed"
  end
end
