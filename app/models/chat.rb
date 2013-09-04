class Chat < ActiveRecord::Base
  belongs_to :from, class_name: "User"
  belongs_to :to, class_name: "User"
  attr_accessible :message, :from_id, :to_id
end
