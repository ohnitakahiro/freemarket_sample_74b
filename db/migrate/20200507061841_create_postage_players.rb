class CreatePostagePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :postage_players do |t|

      t.string :postage_player,	null: false

      t.timestamps
    end
  end
end
