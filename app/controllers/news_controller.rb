class NewsController < ApplicationController
  before_action :find_post
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
  private
  def news_params
    params.require(:news).permit(:title, :body)
  end
  def find_post
    @post = Post.find(params[:post_id])
  end
end
