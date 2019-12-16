require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
	setup do
    @email = "test@test.com"
    @name = @email.partition("@").first
		@user = User.create!(
		  email: @email,
		  password: "test"
    )
    
    @userProfile = Profile.find_by(user: @user)
	end

	test "should create profile" do
		assert_equal(@user, @userProfile.user)
  end
  
  test "should save generated name" do
    assert_equal(@name, @userProfile.name)
	end

  test "should have defaults" do
    assert_equal(false, @userProfile.admin)
    assert_equal(true, @userProfile.student)
    assert_nil(@userProfile.birthday)
  end
  
  test "should not save duplicate user" do
    refute Profile.create(:name => @name, :user => @user).valid?
  end
end
