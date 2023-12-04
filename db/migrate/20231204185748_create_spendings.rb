class CreateSpendings < ActiveRecord::Migration[7.0]
  def change
    create_table :spendings do |t|
      t.string :title
      t.integer :amount

      t.timestamps
    end
  end
end
