class CreateInventoryFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :inventory_foods do |t|
      t.float :quantity
      t.references :food, foreign_key: true
      t.references :inventory, foreign_key: true

      t.timestamps
    end
  end
end
