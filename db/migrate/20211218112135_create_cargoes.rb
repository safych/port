class CreateCargoes < ActiveRecord::Migration[6.1]
  def change
    create_table :cargoes do |t|
      t.string :name, null: false
      t.string :value, null: false
      t.integer :mass, null: false
      t.integer :reg_number, null: false
      t.belongs_to :route, foreign_key: { on_delete: :cascade }
      t.timestamps
    end
  end
end
