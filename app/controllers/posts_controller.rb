class PostsController < ApplicationController
  before_action :set_post, only: [:donate, :show, :update]

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

  def donate

  end

  def update
    @post.update(current_donate: (@post.current_donate || 0) + params[:post][:current_donate].to_f)
    redirect_to post_path
  end

  def top
    @posts = Post.all
    @top = @posts.sort_by { |post| post.reviews.average(:rating) || 0 }.last(3)
    @last = @posts.first(3)
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
