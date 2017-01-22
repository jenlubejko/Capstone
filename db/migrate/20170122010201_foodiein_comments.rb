class FoodieinComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :foodie, :name
  end
end
