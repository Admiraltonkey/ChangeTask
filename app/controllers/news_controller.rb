class NewsController < ApplicationController
  before_action :find_post
  before_action :find_news, only:[:update, :edit, :destroy]
  def new
    @news = News.new
  end
  def create
    @news = News.new(news_params)
    @news.post_id = @post.id
    @news.user_id = current_user.id
    if @news.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    @news = News.find(params[:id])
    if @news.update(news_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @news.destroy
    redirect_to post_path(@post)
  end
  private
  def news_params
    params.require(:news).permit(:title, :body)
  end
  def find_post
    @post = Post.find(params[:post_id])
  end
  def find_news
    @news = News.find(params[:id])
  end
end
