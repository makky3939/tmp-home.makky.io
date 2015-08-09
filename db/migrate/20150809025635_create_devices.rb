class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.column :name, :string, :limit => 32, :null => false
      t.column :crypted_password, :string, :limit => 32, :null => false
      t.column :salt, :string, :limit => 32, :null => false
      t.column :roll, :integer, :default => 0
      t.timestamps null: false
    end
  end
end
