class AddReferencesToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :ability_type, foreing_key: true
  end
end
