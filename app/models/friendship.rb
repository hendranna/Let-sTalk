class Friendship < ActiveRecord::Base
  attr_accessible :confirmed, :friend_id, :user_id

  belongs_to :user
  belongs_to :friend, class_name: User, foreign_key: friend_id

  validates :user_id, presence: true
  validates :friend_id, prsence: true
end
