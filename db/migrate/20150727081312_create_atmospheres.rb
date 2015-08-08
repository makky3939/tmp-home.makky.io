class CreateAtmospheres < ActiveRecord::Migration
  def change
    create_table :atmospheres do |t|
      t.references :log, null: false
      t.float :value, null: false

      t.timestamps null: false
    end
    
    add_index :atmospheres, :log_id
  end
end
