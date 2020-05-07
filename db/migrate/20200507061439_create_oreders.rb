class CreateOreders < ActiveRecord::Migration[5.0]
  def change
    create_table :oreders do |t|

      t.timestamps
    end
  end
end
