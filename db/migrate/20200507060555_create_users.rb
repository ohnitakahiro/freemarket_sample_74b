class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      # t.string	:nickname,	null: false
      t.string	:email,	null: false, unique: true, index: true
      t.string	:password,	null: false
      # t.string	:family_name,	null: false
      # t.date	:first_name,	null: false
      # t.string	:family_name_kana,	null: false
      # t.date	:first_name_kana,	null: false
      # t.date	:birthday,	null: false

      t.timestamps
    end
  end
end


