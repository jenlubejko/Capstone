class Comment < ActiveRecord::Base
  # attr_accessor :text, :foodie_id, :post
  belongs_to :post
end
