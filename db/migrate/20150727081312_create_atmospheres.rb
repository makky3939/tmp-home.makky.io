class CreateAtmospheres < ActiveRecord::Migration
  def change
    create_table :atmospheres do |t|
      t.references :log
      t.float :value, null: false

      t.timestamps null: false
    end
    
    add_index :atmospheres, :log_id
  end
end
