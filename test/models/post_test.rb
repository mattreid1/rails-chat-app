require 'test_helper'

class PostTest < ActiveSupport::TestCase
  setup do
    @post1 = posts(:one)
    @post2 = posts(:two)

    @email = "test@test.com"
    @user = User.create!(
      email: @email,
      password: "test"
    )
  end

  test "should save" do
    post1 = Post.create(title: @post1.title, content: @post1.content)
    assert post1.valid?
  end

  test "should not save 1" do
    post1 = Post.create(title: nil, content: @post1.content)
    refute post1.valid?
  end

  test "should not save 2" do
    post1 = Post.create(title: @post1.title, content: nil)
    refute post1.valid?
  end

  test "should not save 3" do
    post1 = Post.create(title: nil, content: @post1.content)
    refute post1.valid?
  end

  test "should save duplicate" do
    post1 = Post.create(title: @post1.title, content: @post1.content)
    post2 = Post.create(title: @post1.title, content: @post1.content)
    assert post1.valid?
    assert post2.valid?
  end

  test "should save anonymous" do
    post1 = Post.create(title: @post1.title, content: @post1.content)
    assert_nil(post1.user)
  end

  test "should attribute anonymous" do
    post1 = Post.create(title: @post1.title, content: @post1.content)
    assert_nil(post1.user)
  end

  test "should attribute user" do
    post1 = Post.create(title: @post1.title, content: @post1.content, user: @user)
    assert_equal(@user, post1.user)
  end
end
