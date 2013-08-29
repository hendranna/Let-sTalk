class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :avatar, :biography, :firstname, :lastname,:language, :skype_account, :available_to_meet, :email, :password, :password_confirmation, :remember_me, :role
   
  mount_uploader :avatar, AvatarUploader
  # attr_accessible :title, :body

  validates :firstname, presence: true, length:{minimum:2}
  validates :lastname, presence: true, length:{minimum:2}
  validates :language, presence: true, length:{minimum:2}
  validates :biography, length: {maximum: 250,
    too_long: "%{count} characters is the maximum allowed." }

  has_many :friendships
  has_many :friendships_as_friend, class_name: Friendship, foreign_key: friend_id

  def role?(role)
    self.role == role
  end

  private
  def set_default_role
    self.role ||= 'registered'
  end

  



end
