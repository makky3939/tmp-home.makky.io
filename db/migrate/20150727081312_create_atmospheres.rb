class CreateAtmospheres < ActiveRecord::Migration
  def change
    create_table :atmospheres do |t|

      t.timestamps null: false
    end
  end
end
