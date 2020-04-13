class RemoveAbilityTypeFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :ability_type, :string
  end
end
