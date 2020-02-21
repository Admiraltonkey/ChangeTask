class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: [:edit, :update, :destroy]

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, success: 'Компания успешно создана'
    else
      flash.now[:danger] = 'Компания не создана'
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Компания успешно обновлена'
    else
      flash.now[:danger] = 'Компания не обновлена'
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Компания успешно удалена'
  end
  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :summary, :body, :image, :all_tags, :category_id, :url, :desired_donate, :date)
  end
end