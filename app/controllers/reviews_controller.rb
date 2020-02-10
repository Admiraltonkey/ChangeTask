class ReviewsController < ApplicationController
  before_action :find_post
  before_action :find_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.post_id = @post.id
    @review.user_id = current_user.id

    if @review.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end
  def edit

  end
  def update
    if @review.update(review_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end
  def destroy
    @review.destroy
    redirect_to post_path(@post)
  end
  private

  def review_params
    params.require(:review).permit(:rating)
  end

  def find_post
    @post = Post.find(params[:post_id])
  end

  def find_review
    @review = Review.find(params[:id])
  end
end
