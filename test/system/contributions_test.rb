require "application_system_test_case"

class ContributionsTest < ApplicationSystemTestCase
  setup do
    @contribution = contributions(:one)
  end

  test "visiting the index" do
    visit contributions_url
    assert_selector "h1", text: "Contributions"
  end

  test "should create contribution" do
    visit contributions_url
    click_on "New contribution"

    fill_in "Amount", with: @contribution.amount
    fill_in "Campaign", with: @contribution.campaign_id
    fill_in "Committee", with: @contribution.committee_id
    fill_in "Contributor", with: @contribution.contributor_id
    fill_in "Description", with: @contribution.description
    click_on "Create Contribution"

    assert_text "Contribution was successfully created"
    click_on "Back"
  end

  test "should update Contribution" do
    visit contribution_url(@contribution)
    click_on "Edit this contribution", match: :first

    fill_in "Amount", with: @contribution.amount
    fill_in "Campaign", with: @contribution.campaign_id
    fill_in "Committee", with: @contribution.committee_id
    fill_in "Contributor", with: @contribution.contributor_id
    fill_in "Description", with: @contribution.description
    click_on "Update Contribution"

    assert_text "Contribution was successfully updated"
    click_on "Back"
  end

  test "should destroy Contribution" do
    visit contribution_url(@contribution)
    click_on "Destroy this contribution", match: :first

    assert_text "Contribution was successfully destroyed"
  end
end
