class CreateOreders < ActiveRecord::Migration[5.0]
  def change
    create_table :oreders do |t|
      t.references	:user,	null: false, foreign_key: true
      t.references	:item,	null: false, foreign_key: true
      t.timestamps
    end
  end
end
