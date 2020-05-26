class AddColumnItemSoldout < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :soldout, :boolean, null: false, default: false
  end
end
