class Post < ApplicationRecord
  belongs_to :foodie
  has_many :comments
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :title, presence: true
  validates :text, presence: true
end
