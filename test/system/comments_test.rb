require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  setup do
    @post = posts(:one)
  end

  test "creating a Comment" do
    visit post_url(@post)

    fill_in "comment_content", with: 'Thats awesome'
    click_on "Create Comment"

    assert_text "Comment was successfully created"
  end
end
