class RemovingIDtags < ActiveRecord::Migration[5.0]
  def change
    remove_column :tags, :id, :integer
  end
end
