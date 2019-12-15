require 'test_helper'
require "clearance/test_unit"

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    User.create!(
      email: "test@test.com",
      password: "test"
    )

    @profile = Profile.first
  end

  test "should get index" do
    get profiles_url
    assert_response :success
  end

  test "should create profile" do
    email = "test2@test.com"

    # Profile created whenever a user is
	  user = User.create!(
      email: email,
      password: "test"
    )

    assert_equal(email, Profile.find_by(user: user).user.email)
  end

  test "should show profile" do
    get profile_url(@profile)
    assert_response :success
  end

  test "should get edit" do
    get edit_profile_url(@profile)
    assert_response :success
  end

  test "should update profile" do
    patch profile_url(@profile), params: { profile: { admin: @profile.admin, birthday: @profile.birthday, name: @profile.name, student: @profile.student, user_id: @profile.user_id } }
    assert_redirected_to profile_url(@profile)
  end

  test "should destroy profile" do
    assert_difference('Profile.count', -1) do
      delete profile_url(@profile)
    end

    assert_redirected_to profiles_url
  end
end
