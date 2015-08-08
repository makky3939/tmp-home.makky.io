class CreateTemperatures < ActiveRecord::Migration
  def change
    create_table :temperatures do |t|
      t.references :log, null: false
      t.float :value, null: false

      t.timestamps null: false
    end
    
    add_index :temperatures, :log_id
  end
end
