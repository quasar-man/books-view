class Manager::CategoriesController < ApplicationController
  layout 'manager'

  rescue_from Exception,                    with: :manager_render_500
  rescue_from ActiveRecord::RecordNotFound, with: :manager_render_404
  rescue_from ActionController::RoutingError, with: :manager_render_404

  def index
    @categories = Category.all

    respond_to do |format|
      format.html
      format.json { render json: @categories }
    end
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new(category_params)
    if category.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)

    redirect_to controller: :categories, action: :index
  end

  def destroy
    Category.find(params[:id])&.destroy

    redirect_to controller: :categories, action: :index
  end
    
  private

    def category_params
      params.require(:category).permit(:name)
    end
end
