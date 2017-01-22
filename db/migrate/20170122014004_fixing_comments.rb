class FixingComments < ActiveRecord::Migration[5.0]
  def change
    rename_column :comments, :foodies_id, :foodie_id
  end
end
