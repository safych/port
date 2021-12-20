class CreateShips < ActiveRecord::Migration[6.1]
  def change
    create_table :ships do |t|
      t.integer :reg_number, null: false
      t.string :name, null: false
      t.integer :load_capacity, null: false

      t.timestamps
    end
  end
end
