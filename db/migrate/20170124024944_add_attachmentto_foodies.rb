class AddAttachmenttoFoodies < ActiveRecord::Migration[5.0]
  def change
    add_attachment :foodies, :avatar
  end
end
