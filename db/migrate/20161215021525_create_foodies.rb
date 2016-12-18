class CreateFoodies < ActiveRecord::Migration[5.0]
  def change
    create_table :foodies do |t|
      t.string :email
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
