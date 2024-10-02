class DeleteAgeFromFlatmate < ActiveRecord::Migration[7.0]
  def change
    remove_column :flatmates, :age, :integer
  end
end
