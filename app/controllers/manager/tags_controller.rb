class Manager::TagsController < ApplicationController
  layout 'manager'

  rescue_from Exception,                    with: :manager_render_500
  rescue_from ActiveRecord::RecordNotFound, with: :manager_render_404
  rescue_from ActionController::RoutingError, with: :manager_render_404

  def index
    @tags = Tag.all

    respond_to do |format|
      format.html
      format.json { render json: @tags }
    end
  end

  def new
    @tag = Tag.new
  end

  def create
    tag = Tag.new(tag_params)
    if tag.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    tag = Tag.find(params[:id])
    tag.update(tag_params)

    redirect_to controller: :tags, action: :index
  end

  def destroy
    Tag.find(params[:id])&.destroy

    redirect_to controller: :tags, action: :index
  end
    
  private

    def tag_params
      params.require(:tag).permit(:name)
    end
end
