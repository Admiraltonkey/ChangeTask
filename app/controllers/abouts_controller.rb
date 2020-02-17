class AboutsController < ApplicationController
  before_action :find_user
  before_action :find_about, only: [:edit, :update, :destroy]
  def new
    @about = About.new
  end
  def create
    @about = About.new(about_params)
    @about.user_id = @user.id
    @about.user_id = current_user.id
    if @about.save
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end
  def update
    if @about.update(about_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  def destroy
    @about.destroy
    redirect_to user_path(@user)
  end
  private
  def about_params
    params.require(:about).permit(:name, :surname, :city, :data)
  end
  def find_user
    @user = User.find(params[:user_id])
  end
  def find_about
    @about = About.find(params[:id])
  end
end
