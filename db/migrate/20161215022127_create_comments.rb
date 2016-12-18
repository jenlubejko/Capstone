class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :post_id
      t.integer :comment_id
      t.integer :foodie_id

      t.timestamps
    end
  end
end
