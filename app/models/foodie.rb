class Foodie < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :followers, through: :followers, source: :follower, dependent: :destroy
  has_many :followees, through: :followers, source: :followee, dependent: :destroy
end
