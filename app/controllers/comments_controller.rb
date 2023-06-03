class CommentsController < ApplicationController
  def new
    @post = @user.posts.find(params[:post_id])
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.author = @user
    return unless @comment.save

    @user = User.find(params[:user_id])
    redirect_to user_post_path(@user, @post)
    # else
    #   render :new
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
