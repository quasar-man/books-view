class Manager::AuthorsController < ApplicationController
  layout 'manager'

  rescue_from Exception,                    with: :manager_render_500
  rescue_from ActiveRecord::RecordNotFound, with: :manager_render_404
  rescue_from ActionController::RoutingError, with: :manager_render_404

  def index
    @authors = Author.all

    respond_to do |format|
      format.html
      format.json { render json: @authors }
    end
  end

  def new
    @author = Author.new
  end

  def create
    author = Author.new(author_params)
    if author.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end

  def edit
    @author = Author.find(params[:id])
  end

  def update
    author = Author.find(params[:id])
    author.update(author_params)

    redirect_to controller: :authors, action: :index
  end

  def destroy
    Author.find(params[:id])&.destroy

    redirect_to controller: :authors, action: :index
  end
    
  private

    def author_params
      params.require(:author).permit(:name)
    end
end
