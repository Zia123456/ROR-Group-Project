class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :name
      t.references :user, foreign_key: true
      t.string :description
      t.timestamps
    end
  end
end
