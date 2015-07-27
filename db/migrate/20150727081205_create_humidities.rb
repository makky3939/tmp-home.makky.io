class CreateHumidities < ActiveRecord::Migration
  def change
    create_table :humidities do |t|

      t.timestamps null: false
    end
  end
end
