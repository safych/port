class CreateRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes do |t|
      t.belongs_to :ship, foreign_key: { on_delete: :cascade }
      t.belongs_to :from_port, foreign_key: { to_table: :ship_ports, on_delete: :cascade }
      t.belongs_to :to_port, foreign_key: { to_table: :ship_ports, on_delete: :cascade }
      t.time :departure_time
      t.time :arrival_time
      t.timestamps
    end
  end
end
