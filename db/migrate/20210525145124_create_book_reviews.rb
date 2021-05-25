class CreateBookReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :book_reviews do |t|
      t.references :book, foreign_key: true
      t.text :review

      t.timestamps
    end
  end
end
