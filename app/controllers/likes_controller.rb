class LikesController < ApplicationController
  before_action :load_items
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
      flash[:notice] = "You can't like more than once"
    else
      @like = @comment.likes.create(user_id: current_user.id)
    end
    redirect_to post_path(@post)
  end

  def destroy
    if !(already_liked?)
      flash[:notice] = "Cannot unlike"
    else
      @like.destroy
    end
    redirect_to post_path(@post)
  end

  private

  def load_items
    @comment = Comment.find(params[:comment_id])
    @post = @comment.post
  end

  def find_like
    @like = @comment.likes.find(params[:id])
  end

  def already_liked?
    Like.where(comment_id: @comment.id, user_id: current_user.id).exists?
  end
end
