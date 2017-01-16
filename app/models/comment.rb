class Comment < ActiveRecord::Base
  attr_accessor :body, :foodie_id, :post
  belongs_to :post
end
