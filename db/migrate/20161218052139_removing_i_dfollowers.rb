class RemovingIDfollowers < ActiveRecord::Migration[5.0]
  def change
    remove_column :followers, :id, :integer
  end
end
