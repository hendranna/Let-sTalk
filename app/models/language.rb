class Language < ActiveRecord::Base
  attr_accessible :name, :user_languages_attributes
  #has_many :user_languages, dependent: :destroy
  has_many :user_languages
  has_many :users, through: :user_languages
end 
