class CreatePublishers < ActiveRecord::Migration[6.1]
  def change
    create_table :publishers do |t|
      t.string :name, limit: 128

      t.timestamps
    end
  end
end
