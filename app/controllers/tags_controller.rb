class TagsController < ApplicationController
  def index
    @tags = Tag.order(name: :asc)
    respond_to do |format|
      format.json{
        render json: { tags: @tags }
      }
      format.html{

      }
    end
  end

  def show
    @tag = Tag.find(params[:id])
    respond_to do |format|
    format.json{
      render json: { tag: @tag }
    }
    format.html{

    }
    end
  end

  def new
    @tag = Tag.new
    respond_to do |format|
      format.json{
        render json: { tag: @tag }
      }
      format.html{

      }
    end
  end

  def create
    @tag = Tag.new(tag_params)
    if @tag.save
      respond_to do |format|
        format.json{
          render json: { tag: @tag, success: "Successfully created the tag" }
        }
        format.html{
          flash[:success] = "Successfully created the tag"
          redirect_to tags_path
        }
      end
    else
      respond_to do |format|
        format.json{
          render json: { warning: "Unable to create tag" }
        }
        format.html{
          flash.now[:warning] = "Unable to create tag"
        }
      end
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    respond_to do |format|
      format.json{
        render json: { tag: @tag }
      }
      format.html{

      }
    end
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      respond_to do |format|
        format.json{
          render json: { success: "Successfully updated the tag" }
        }
        format.html{
          flash.now[:success] = "Successfully updated the tag"
        }
      end
    else
      respond_to do |format|
        format.json{
          render json: { warning: "Unable to update the tag" }
        }
        format.html{
          flash.now[:warning] = "Unable to update the tag"
        }
      end
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    if @tag.delete
      respond_to do |format|
        format.json{
          render json: { success: "Successfully deleted the tag" }
        }
        format.html{
          flash[:success] = "Successfully deleted the tag"
          redirect_to tags_path
        }
      end
    else
      respond_to do |format|
        format.json{
          render json: { warning: "Unable to delete the tag" }
        }
        format.html{
          flash[:warning] = "Unable to delete the tag"
          redirect_to tags_path
        }
      end
    end
  end

  private
    def tag_params
      params.require(:tag).permit(:name, :description)
    end
end
