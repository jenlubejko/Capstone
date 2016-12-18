class Post < ApplicationRecord
  belongs_to :foodie
  has_many :comments
  has_many :tags, through: :post_tags
end
