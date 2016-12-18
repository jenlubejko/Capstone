class RemovingIDcomments < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :id, :integer
  end
end
