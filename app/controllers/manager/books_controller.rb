class Manager::BooksController < ApplicationController
  layout 'manager'

  rescue_from Exception,                    with: :manager_render_500
  rescue_from ActiveRecord::RecordNotFound, with: :manager_render_404
  rescue_from ActionController::RoutingError, with: :manager_render_404

  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end


  private

    def book_params
      params.require(:book).permit(
        :name,
        :publisher_id,
        :price,
        :summary,
        :release_date,
        { category_ids: [] },
        { tag_ids: [] },
        { author_ids: [] },
        { image_urls: [] },
        book_review_attributes: [:review]
      )
    end
end
