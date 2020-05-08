class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|

      t.text :name,	null: false
      t.string :introduction,	null: false
      # t.references :category_id,	null: false, foreign_key: true
      # t.references :size_id,	null: false, foreign_key: true
      # t.references :brand_id,	foreign_key: true
      # t.references :item_condition_id,	null: false, foreign_key: true
      # t.references :postage_player_id,	null: false, foreign_key: true
      # t.references :region_id,	null: false, foreign_key: true
      # t.references :preparation_day_id,	null: false, foreign_key: true
      t.integer :price,	null: false
      # t.references :user_id,	null: false, foreign_key: true

      t.timestamps
    end
  end
end
