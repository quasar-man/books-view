class CreateCategorizes < ActiveRecord::Migration[6.1]
  def change
    create_table :categorizes do |t|
      t.references :book, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
