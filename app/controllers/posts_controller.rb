class PostsController < ApplicationController
  def index
    @posts = Post.order(updated_at: :asc)
    respond_to do |format|
      format.json{
        render json: { posts: @posts, info: "Welcome to my blog" }
      }
      format.html{
        flash.now[:info] = "Welcome to my blog"
      }
    end
  end

  def show
    @post = Post.find(id)
    respond_to do |format|
      format.json{
        render json: { post: @post }
      }
      format.html{

      }
    end
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:name, :description)
    end
end
