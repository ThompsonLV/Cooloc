class CreateFlatmates < ActiveRecord::Migration[7.0]
  def change
    create_table :flatmates do |t|
      t.string :first_name
      t.string :last_name
      t.integer :age
      t.date :birthday
      t.string :description
      t.references :colocation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
