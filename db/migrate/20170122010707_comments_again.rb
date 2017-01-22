class CommentsAgain < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :foodie, :name
  end
end
