require "test_helper"

class CommitteesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @committee = committees(:one)
  end

  test "should get index" do
    get committees_url
    assert_response :success
  end

  test "should get new" do
    get new_committee_url
    assert_response :success
  end

  test "should create committee" do
    assert_difference("Committee.count") do
      post committees_url, params: { committee: { city: @committee.city, election_id: @committee.election_id, email: @committee.email, name: @committee.name, office: @committee.office, street: @committee.street, telephone: @committee.telephone } }
    end

    assert_redirected_to committee_url(Committee.last)
  end

  test "should show committee" do
    get committee_url(@committee)
    assert_response :success
  end

  test "should get edit" do
    get edit_committee_url(@committee)
    assert_response :success
  end

  test "should update committee" do
    patch committee_url(@committee), params: { committee: { city: @committee.city, election_id: @committee.election_id, email: @committee.email, name: @committee.name, office: @committee.office, street: @committee.street, telephone: @committee.telephone } }
    assert_redirected_to committee_url(@committee)
  end

  test "should destroy committee" do
    assert_difference("Committee.count", -1) do
      delete committee_url(@committee)
    end

    assert_redirected_to committees_url
  end
end
