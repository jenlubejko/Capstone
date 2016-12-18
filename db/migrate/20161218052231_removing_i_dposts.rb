class RemovingIDposts < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :id, :integer
  end
end
