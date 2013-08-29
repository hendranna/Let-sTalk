class Friendship < ActiveRecord::Base
  attr_accessible :confirmed, :friend_id, :user_id

  belongs_to :user
  belongs_to :friend, :class_name => 'User', :foreign_key => 'friend_id'


  validates :user_id, presence: true
  validates :friend_id, presence: true
  validates :user_id, uniqueness: { scope: :friend_id }

  scope :confirmed, where(confirmed: true)
end


# def self.exists?(user, friend)
#   not find_by_user_id_and_friend_id(user, friend).nil?
# end

# def self.request(user, friend)
#   unless customer == friend || Frienships.exists?(user, friend)
#     transaction do
#       create(user: user, friend: friend, confirmed: true)
#       create(user: friend, friend: user, confirmed: true)
#     end
#   end
# end

# def self.accept(user, friend)
#   transaction do 
#     accept_one_side(user, friend)
#     accept_one side(friend, user)
#   end
# end

# def self.breakup(user, friend)
#   transaction do
#     destroy(find_by_user_id_and_friend_id(user, friend))
#     destroy(find_by_user_id_and_friend_id(friend, user))
#   end
# end



