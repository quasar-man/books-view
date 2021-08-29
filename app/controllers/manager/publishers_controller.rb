class Manager::PublishersController < ApplicationController
  layout 'manager'

  rescue_from Exception,                    with: :manager_render_500
  rescue_from ActiveRecord::RecordNotFound, with: :manager_render_404
  rescue_from ActionController::RoutingError, with: :manager_render_404

  def index
    @publishers = Publisher.all

    respond_to do |format|
      format.html
      format.json { render json: @publishers }
    end
  end

  def new
    @publisher = Publisher.new
  end

  def create
    publisher = Publisher.new(publisher_params)
    if publisher.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def update
    publisher = Publisher.find(params[:id])
    publisher.update(publisher_params)

    redirect_to controller: :publishers, action: :index
  end

  def destroy
    Publisher.find(params[:id])&.destroy

    redirect_to controller: :publishers, action: :index
  end

  private

    def publisher_params
      params.require(:publisher).permit(:name)
    end
end
