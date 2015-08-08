class CreateHumidities < ActiveRecord::Migration
  def change
    create_table :humidities do |t|
      t.references :log, null: false
      t.float :value, null: false

      t.timestamps null: false
    end
    
    add_index :humidities, :log_id
  end
end
