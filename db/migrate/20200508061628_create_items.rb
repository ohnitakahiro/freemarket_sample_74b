class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.string :category_id,	null: false, foreign_key: true
      t.string :size
      t.string :brand
      t.string :condition, null: false
      t.string :postage_player, null: false
      t.string :region, null: false
      t.string :preparation_days, null: false
      t.integer :price, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
