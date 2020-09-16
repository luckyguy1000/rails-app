require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @comment = comments(:one)
  end

  test "should create comment" do
    assert_difference('Comment.count') do
      post post_comments_url(@post), params: { comment: { content: @comment.content } }
    end

    assert_redirected_to post_url(Post.last, anchor: Comment.last.to_anchor)
  end
end
