class CreateCreditCards < ActiveRecord::Migration[5.0]
  def change
    create_table :credit_cards do |t|
      t.integer	:card_number,	null: false
      t.integer	:expiration_year,	null: false
      t.integer	:expiration_month,	null: false
      t.integer	:security,	null: false
      t.references	:user,	null: false, foreign_key: true

      t.timestamps
    end
  end
end
