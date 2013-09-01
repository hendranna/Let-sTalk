class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :avatar, :biography, :firstname, :lastname, :skype_account, :available_to_meet, :email, :password, :password_confirmation, :remember_me, :role, :user_languages_attributes
   
  mount_uploader :avatar, AvatarUploader
  # attr_accessible :title, :body

  validates :firstname, presence: true, length:{minimum:2}
  validates :lastname, presence: true, length:{minimum:2}
  validates :biography, length: {maximum: 250,
    too_long: "%{count} characters is the maximum allowed." }

  has_many :friendships
  has_many :friendships_as_friend, class_name: "Friendship", foreign_key: "friend_id"

  has_many :user_languages
  has_many :languages, through: :user_languages
  # has_many :friendships_as_friender, class_name: "User", foreign_key: "user_id"
  
  before_save :assign_role

  accepts_nested_attributes_for :user_languages, allow_destroy: true
  
  def assign_role
    self.role = "registered" if self.role.nil?
  end

  def role?(role)
    self.role == role
  end

  private
  def set_default_role
    self.role ||= 'registered'
  end

  def all_friendships
    friendships + friendships_as_friend
  end

 


  



  



end
