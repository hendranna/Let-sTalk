class Language < ActiveRecord::Base
  attr_accessible :name
  #has_many :user_languages, dependent: :destroy
  has_many :users, through: :user_language
end
