require "application_system_test_case"

class CampaignScheduleFsTest < ApplicationSystemTestCase
  setup do
    @campaign_schedule_f = campaign_schedule_fs(:one)
  end

  test "visiting the index" do
    visit campaign_schedule_fs_url
    assert_selector "h1", text: "Campaign schedule fs"
  end

  test "should create campaign schedule f" do
    visit campaign_schedule_fs_url
    click_on "New campaign schedule f"

    fill_in "Balance", with: @campaign_schedule_f.balance
    fill_in "Campaign", with: @campaign_schedule_f.campaign_id
    fill_in "Payments", with: @campaign_schedule_f.payments
    fill_in "Receipts", with: @campaign_schedule_f.receipts
    click_on "Create Campaign schedule f"

    assert_text "Campaign schedule f was successfully created"
    click_on "Back"
  end

  test "should update Campaign schedule f" do
    visit campaign_schedule_f_url(@campaign_schedule_f)
    click_on "Edit this campaign schedule f", match: :first

    fill_in "Balance", with: @campaign_schedule_f.balance
    fill_in "Campaign", with: @campaign_schedule_f.campaign_id
    fill_in "Payments", with: @campaign_schedule_f.payments
    fill_in "Receipts", with: @campaign_schedule_f.receipts
    click_on "Update Campaign schedule f"

    assert_text "Campaign schedule f was successfully updated"
    click_on "Back"
  end

  test "should destroy Campaign schedule f" do
    visit campaign_schedule_f_url(@campaign_schedule_f)
    click_on "Destroy this campaign schedule f", match: :first

    assert_text "Campaign schedule f was successfully destroyed"
  end
end
