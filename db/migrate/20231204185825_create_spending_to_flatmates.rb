class CreateSpendingToFlatmates < ActiveRecord::Migration[7.0]
  def change
    create_table :spending_to_flatmates do |t|
      t.references :flatmate, null: false, foreign_key: true
      t.references :spending, null: false, foreign_key: true

      t.timestamps
    end
  end
end
