class CreateBookImages < ActiveRecord::Migration[6.1]
  def change
    create_table :book_images do |t|
      t.references :book, foreign_key: true
      t.string :image_url, limit: 255

      t.timestamps
    end
  end
end
