class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :title
      t.string :description
      t.date :begin_date
      t.date :end_date

      t.timestamps
    end
  end
end
