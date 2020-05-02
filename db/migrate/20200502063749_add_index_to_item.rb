class AddIndexToItem < ActiveRecord::Migration[5.2]
  def change
    add_index :items, :name
    add_index :items, :race
  end
end
