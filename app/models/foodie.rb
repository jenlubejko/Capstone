class Foodie < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :follower_relationships, class_name: :Follower, foreign_key: :followee_id
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :followee_relationships, class_name: :Follower, foreign_key: :follower_id
  has_many :followees, through: :followee_relationships, source: :followee
end
