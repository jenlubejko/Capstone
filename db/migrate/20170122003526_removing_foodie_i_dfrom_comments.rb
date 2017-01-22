class RemovingFoodieIDfromComments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :foodie_id, :integer
  end
end
