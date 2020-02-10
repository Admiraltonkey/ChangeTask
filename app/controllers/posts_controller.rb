class PostsController < ApplicationController
  before_action :set_post, only: :show

  def search
    @posts = Post.search(params[:search])
  end

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).search(params[:search])
  end

  def show
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
