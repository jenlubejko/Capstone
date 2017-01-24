class Foodie < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :comments
  has_many :follower_relationships, class_name: :Follower, foreign_key: :followee_id
  has_many :followers, through: :follower_relationships, source: :follower

  has_many :followee_relationships, class_name: :Follower, foreign_key: :follower_id
  has_many :followees, through: :followee_relationships, source: :followee
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :name, :email, :password, :password_confirmation, :avatar, presence: :true
end
