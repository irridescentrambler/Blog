class PostsController < ApplicationController
  caches_page :index, :show, :new

  def index
    @posts = Post.order(name: :asc).includes(:tags)
    respond_to do |format|
      format.json{
        render json: { posts: @posts, info: "Welcome to my blog" }
      }
      format.html{

      }
    end
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
      format.json{
        render json: { post: @post }
      }
      format.html{

      }
    end
  end

  def new
    @post = Post.new
    @tags = Tag.order(name: :asc)
    respond_to do |format|
      format.json{
        render json: { post: @post, tags: @tags }
      }
      format.html{

      }
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      respond_to do |format|
        format.json{
          render json: { post: @post, success: "Post created successfully" }
        }
        format.html{
          flash[:success] = "Post created successfully"
          redirect_to posts_path
        }
      end
    else
      respond_to do |format|
        format.json{
          render json: { post: @post, warning: "Unable to create post", errors: @post.errors.full_messages }
        }
        format.html{
          flash.now[:warning] = "Unable to create post"
        }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
    respond_to do |format|
      format.json{
        render json: { post: @post }
      }
      format.html{

      }
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      respond_to do |format|
        format.json{
          render json: { post: @post, success: "Successfully updated the post" }
        }
        format.html{
          flash.now[:success] = "Successfully updated the post"
        }
      end
    else
      respond_to do |format|
        format.json{
          render json: { warning: "Unable to update the post" }
        }
        format.html{
          flash.now[:warning] = "Unable to update the post"
        }
      end
    end
  end

  def destroy
    @post = Post.find(id)
    if @post.delete
      respond_to do |format|
        format.json{
          render json: { success: "Successfully deleted the post" }
        }
        format.html{
          flash[:success] = "Successfully deleted the post"
        }
      end
    else
      respond_to do |format|
        format.json{
          render json: { warning: "Unable to delete the post" }
        }
        format.html{
          flash[:warning] = "Unable to delete the post"
        }
      end
    end
  end

  private
    def post_params
      params.require(:post).permit(:name, :description, tag_ids: [])
    end
end
