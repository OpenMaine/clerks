require "test_helper"

class ContributorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contributor = contributors(:one)
  end

  test "should get index" do
    get contributors_url
    assert_response :success
  end

  test "should get new" do
    get new_contributor_url
    assert_response :success
  end

  test "should create contributor" do
    assert_difference("Contributor.count") do
      post contributors_url, params: { contributor: { description: @contributor.description, name: @contributor.name, zip: @contributor.zip } }
    end

    assert_redirected_to contributor_url(Contributor.last)
  end

  test "should show contributor" do
    get contributor_url(@contributor)
    assert_response :success
  end

  test "should get edit" do
    get edit_contributor_url(@contributor)
    assert_response :success
  end

  test "should update contributor" do
    patch contributor_url(@contributor), params: { contributor: { description: @contributor.description, name: @contributor.name, zip: @contributor.zip } }
    assert_redirected_to contributor_url(@contributor)
  end

  test "should destroy contributor" do
    assert_difference("Contributor.count", -1) do
      delete contributor_url(@contributor)
    end

    assert_redirected_to contributors_url
  end
end
