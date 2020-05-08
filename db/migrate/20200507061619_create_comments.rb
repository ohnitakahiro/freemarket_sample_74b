class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.references	:user_id,	null: false
      t.references	:item_id,	null: false
      t.text	:text,	null: false

      t.timestamps
    end
  end
end
