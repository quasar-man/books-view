class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.references :publisher, foreign_key: true
      t.string :name, limit: 128
      t.decimal :price, precision: 10, scale: 2
      t.string :summary, limit: 1024
      t.date :release_date

      t.timestamps
    end
  end
end
