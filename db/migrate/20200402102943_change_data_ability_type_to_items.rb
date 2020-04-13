class ChangeDataAbilityTypeToItems < ActiveRecord::Migration[5.2]
  def change
    change_column :items, :ability_type, :string
  end
end
