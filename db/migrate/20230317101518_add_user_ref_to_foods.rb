class AddUserRefToFoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :foods, :author, foreign_key: { to_table: 'users' }
  end
end
