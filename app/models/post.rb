class Post < ApplicationRecord
  belongs_to :foodie
  default_scope {  order(created_at: :desc) }
  has_many :images
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :text, presence: true
end
