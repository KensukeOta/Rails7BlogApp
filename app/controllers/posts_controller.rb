class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: "DESC")
  end

  def show
    @post = Post.find(params[:id])
  end

  def new 
    @post = Post.new
  end

  def create 
    @post = Post.new(post_params)
    puts @post

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
