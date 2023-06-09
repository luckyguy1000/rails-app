class CommentsController < ApplicationController
  before_action :set_post

  def create
    comment = @post.comments.create(comment_params)

    if comment.persisted?
      redirect_to post_path(@post, anchor: comment.to_anchor), notice: 'Comment added'
    else
      error_message = comment.errors.full_messages.first || 'Error happened'
      redirect_to @post, alert: error_message
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:parent_id, :content)
  end
end
