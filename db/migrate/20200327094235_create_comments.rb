class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :image
      t.text :ability
      t.string :consumer
      t.text :skill

      t.timestamps
    end
  end
end
