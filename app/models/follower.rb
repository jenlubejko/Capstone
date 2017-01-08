class Follower < ApplicationRecord
  belongs_to :follower, class_name: :Foodie, foreign_key: :follower_id
  belongs_to :followee, class_name: :Foodie, foreign_key: :followee_id
end
