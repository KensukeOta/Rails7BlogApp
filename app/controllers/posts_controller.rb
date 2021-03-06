class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: "DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new 
    authenticate_user!
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authenticate_user!
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      redirect_to root_path
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
