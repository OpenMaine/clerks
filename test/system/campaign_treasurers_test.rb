require "application_system_test_case"

class CampaignTreasurersTest < ApplicationSystemTestCase
  setup do
    @campaign_treasurer = campaign_treasurers(:one)
  end

  test "visiting the index" do
    visit campaign_treasurers_url
    assert_selector "h1", text: "Campaign treasurers"
  end

  test "should create campaign treasurer" do
    visit campaign_treasurers_url
    click_on "New campaign treasurer"

    fill_in "Address", with: @campaign_treasurer.address
    fill_in "Campaign", with: @campaign_treasurer.campaign_id
    fill_in "City", with: @campaign_treasurer.city
    fill_in "Email", with: @campaign_treasurer.email
    fill_in "Name", with: @campaign_treasurer.name
    fill_in "Telephone", with: @campaign_treasurer.telephone
    click_on "Create Campaign treasurer"

    assert_text "Campaign treasurer was successfully created"
    click_on "Back"
  end

  test "should update Campaign treasurer" do
    visit campaign_treasurer_url(@campaign_treasurer)
    click_on "Edit this campaign treasurer", match: :first

    fill_in "Address", with: @campaign_treasurer.address
    fill_in "Campaign", with: @campaign_treasurer.campaign_id
    fill_in "City", with: @campaign_treasurer.city
    fill_in "Email", with: @campaign_treasurer.email
    fill_in "Name", with: @campaign_treasurer.name
    fill_in "Telephone", with: @campaign_treasurer.telephone
    click_on "Update Campaign treasurer"

    assert_text "Campaign treasurer was successfully updated"
    click_on "Back"
  end

  test "should destroy Campaign treasurer" do
    visit campaign_treasurer_url(@campaign_treasurer)
    click_on "Destroy this campaign treasurer", match: :first

    assert_text "Campaign treasurer was successfully destroyed"
  end
end
