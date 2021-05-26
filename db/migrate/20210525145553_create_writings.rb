class CreateWritings < ActiveRecord::Migration[6.1]
  def change
    create_table :writings do |t|
      t.references :book, foreign_key: true
      t.references :author, foreign_key: true

      t.timestamps
    end
  end
end
