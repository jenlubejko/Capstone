class Comment < ActiveRecord::Base
  # attr_accessor :text, :foodie_id, :post
  belongs_to :post
  belongs_to :foodie 
end
