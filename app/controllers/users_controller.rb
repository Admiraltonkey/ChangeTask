class UsersController < ApplicationController
  before_action :set_user,only: [:show, :destroy]
  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end
  def destroy
    @user.destroy
    redirect_to posts_path
  end
  private
  def set_user
    @user = User.find(params[:id])
  end
end
