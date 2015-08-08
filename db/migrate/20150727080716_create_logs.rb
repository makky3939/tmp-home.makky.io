class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :atmosphere
      t.references :humidity
      t.references :temperature
      t.references :location, null: false

      t.timestamps null: false
    end
    
    add_index :logs, :atmosphere_id
    add_index :logs, :humidity_id
    add_index :logs, :temperature_id
    add_index :logs, :location_id
  end
end
