class PostsController < ApplicationController
  before_action :set_post, only: :show

  def search
    @posts = Post.search(params[:search])
  end

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).search(params[:search])
  end

  def show
    if @post.reviews.blank?
      @average_review = 0
    else
      @average_review = @post.reviews.average(:rating).round(2)
    end
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
