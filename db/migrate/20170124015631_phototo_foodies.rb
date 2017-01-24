class PhototoFoodies < ActiveRecord::Migration[5.0]
  def change
    add_column :foodies, :image_url, :string
  end
end
