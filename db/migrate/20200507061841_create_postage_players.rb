class CreatePostagePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :postage_players do |t|

      t.timestamps
    end
  end
end
