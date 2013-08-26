class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :avatar, :biography, :first_name, :last_name,:language, :skype_account, :available_to_meet, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :first_name, presence: true, length:{minimum:2}
  validates :last_name, presence: true, length:{minimum:2}
  validates :language, presence: true, length:{minimum:2}
  validates :biography, length: {maximum: 250,
    too_long: "%{count} characters is the maximum allowed." }

end
