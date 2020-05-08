class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer	:post_code,	null: false
      t.string	:prefectures,	null: false
      t.string	:city,	null: false
      t.string	:block,	null: false
      t.string	:building	
      t.integer	:phone_number,	unique: true
      t.references	:user,	null: false, foreign_key: true

      t.timestamps
    end
  end
end
