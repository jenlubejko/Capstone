class RemovingIDfoodies < ActiveRecord::Migration[5.0]
  def change
    remove_column :foodies, :id, :integer
  end
end
