class Chat < ActiveRecord::Base
  belongs_to :from_id
  belongs_to :to_id
  attr_accessible :message
end
