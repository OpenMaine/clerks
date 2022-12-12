require "application_system_test_case"

class ContributorsTest < ApplicationSystemTestCase
  setup do
    @contributor = contributors(:one)
  end

  test "visiting the index" do
    visit contributors_url
    assert_selector "h1", text: "Contributors"
  end

  test "should create contributor" do
    visit contributors_url
    click_on "New contributor"

    fill_in "Description", with: @contributor.description
    fill_in "Name", with: @contributor.name
    fill_in "Zip", with: @contributor.zip
    click_on "Create Contributor"

    assert_text "Contributor was successfully created"
    click_on "Back"
  end

  test "should update Contributor" do
    visit contributor_url(@contributor)
    click_on "Edit this contributor", match: :first

    fill_in "Description", with: @contributor.description
    fill_in "Name", with: @contributor.name
    fill_in "Zip", with: @contributor.zip
    click_on "Update Contributor"

    assert_text "Contributor was successfully updated"
    click_on "Back"
  end

  test "should destroy Contributor" do
    visit contributor_url(@contributor)
    click_on "Destroy this contributor", match: :first

    assert_text "Contributor was successfully destroyed"
  end
end
