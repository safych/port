class CreateShipPorts < ActiveRecord::Migration[6.1]
  def change
    create_table :ship_ports do |t|
      t.string :name, null: false
      t.string :location, null: false

      t.timestamps
    end
  end
end
