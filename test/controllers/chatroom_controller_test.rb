require 'test_helper'

class ChatroomControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get "/chatroom"
    assert_response :success
  end
end
