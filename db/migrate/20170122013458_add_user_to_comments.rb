class AddUserToComments < ActiveRecord::Migration[5.0]
  def change
    add_reference :comments, :foodies, foreign_key: true
  end
end
