class Foodie < ApplicationRecord
  has_secure_password
  has_many :posts
  has_many :followers, through: :followers, source: :follower
  has_many :followees, through: :followers, source: :followee
end
