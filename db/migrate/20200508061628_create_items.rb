class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|

      t.text :name,	null: false
      t.string :introduction,	null: false
      # t.references :category,	null: false, foreign_key: true
      # t.references :size,	null: false, foreign_key: true
      # t.references :brand,	foreign_key: true
      # t.references :item_condition,	null: false, foreign_key: true
      # t.references :postage_player,	null: false, foreign_key: true
      # t.references :region,	null: false, foreign_key: true
      # t.references :preparation_day,	null: false, foreign_key: true
      t.integer :price,	null: false
      # t.references :user,	null: false, foreign_key: true

      t.timestamps
    end
  end
end
