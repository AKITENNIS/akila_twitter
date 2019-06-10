require 'test_helper'

class FollowControllerTest < ActionDispatch::IntegrationTest
  test "should get following" do
    get follow_following_url
    assert_response :success
  end

  test "should get followed" do
    get follow_followed_url
    assert_response :success
  end

end
