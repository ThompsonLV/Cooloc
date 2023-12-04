class CreateShoppings < ActiveRecord::Migration[7.0]
  def change
    create_table :shoppings do |t|
      t.string :item
      t.boolean :bought
      t.integer :quantity
      t.references :colocation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
