class UserLanguage < ActiveRecord::Base
  attr_accessible :language_id, :user_id, :level
  belongs_to :language
  belongs_to :user

  validates :language_id, uniqueness: { scope: :user_id }
end
