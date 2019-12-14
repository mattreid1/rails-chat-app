require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
	test "should return contact email" do
    mail = ContactMailer.contact_email("matthew@me.com",
    "Matthew Casey", "1234567890", @message = "Hello")
    assert_equal ['mr00846@surrey.ac.uk'], mail.to
    assert_equal ['website@com2025.mattreid.dev'], mail.from
	end
end
