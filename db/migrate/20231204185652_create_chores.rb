class CreateChores < ActiveRecord::Migration[7.0]
  def change
    create_table :chores do |t|
      t.string :title
      t.string :content
      t.integer :frequency
      t.date :begin_date
      t.references :colocation, null: false, foreign_key: true
      t.references :flatmate, null: false, foreign_key: true

      t.timestamps
    end
  end
end
