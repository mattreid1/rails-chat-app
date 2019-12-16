require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  setup do
    @msg1 = messages(:one)
    @msg2 = messages(:two)

    @email = "test@test.com"
    @user = User.create!(
      email: @email,
      password: "test"
    )
  end

  test "should save" do
    msg1 = Message.create(content: @msg1.content, user: @user)
    assert msg1.valid?
  end

  test "should save different messages" do
    msg1 = Message.create(content: @msg1.content, user: @user)
    msg2 = Message.create(content: @msg2.content, user: @user)

    assert msg1.valid?
    assert msg2.valid?
  end

  test "should not save 1" do
    msg1 = Message.create(content: nil, user: @user)
    refute msg1.valid?
  end

  test "should not save 2" do
    msg1 = Message.create(content: @msg1.content, user: nil)
    refute msg1.valid?
  end

  test "should not save 3" do
    msg1 = Message.create(content: nil, user: nil)
    refute msg1.valid?
  end

  test "should save duplicate" do
    msg1 = Message.create(content: @msg1.content, user: @user)
    msg2 = Message.create(content: @msg1.content, user: @user)

    assert msg1.valid?
    assert msg2.valid?
  end
end
