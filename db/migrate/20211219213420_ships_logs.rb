class ShipsLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :ships_logs do |t|
      t.timestamps 
      t.string :event_type
      t.text :ship_data
    end
  end
end
