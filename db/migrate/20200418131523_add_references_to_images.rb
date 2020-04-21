class AddReferencesToImages < ActiveRecord::Migration[5.2]
  def change
    add_reference :images, :item, foreing_key: true
  end
end
