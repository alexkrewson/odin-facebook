require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers


  setup do
    @post = posts(:one)
    @comment = @post.comments.first
  end

  test "should get index" do
    get post_comments_url(@post)
    assert_response :success
  end

  test "should get new" do
    sign_in users(:one)
    get new_post_comment_url(@post)
    assert_response :success
  end

  test "should create comment" do
    sign_in users(:one)
    assert_difference('Comment.count') do
      post post_comments_url(@post), params: {comment: { body: @comment.body }}
    end

    assert_redirected_to root_path
  end

  test "should show comment" do
    sign_in users(:one)

    get post_comment_url(@post,@comment)
    assert_response :success
  end

  test "should get edit" do
    sign_in users(:one)
    get edit_post_comment_url(@post,@comment)
    assert_response :success
  end

  test "should update comment" do
    sign_in users(:one)
    patch post_comment_url(@post,@comment), params: { comment: { body: @comment.body } }
    assert_redirected_to root_path
  end

  test "should destroy comment" do
    assert_difference('Comment.count', -1) do
      delete post_comment_url(@post,@comment)
    end

    assert_redirected_to post_comments_url
  end
end
