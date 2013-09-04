class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,  :omniauthable,omniauth_providers: [:google_oauth2]

  attr_accessible :avatar, :biography, :firstname, :lastname, :skype_account, :available_to_meet, :email, :password, :password_confirmation, :remember_me, :role, :user_languages_attributes, :provider, :uid
   
  mount_uploader :avatar, AvatarUploader

  validates :firstname, presence: true, length:{minimum:2}
  validates :lastname, presence: true, length:{minimum:2}
  validates :biography, length: {maximum: 250,
    too_long: "%{count} characters is the maximum allowed." }

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :friendships_as_friend, class_name: "Friendship", foreign_key: "friend_id"
  has_many :friends_as_friend, through: :friendships_as_friend, source: :user


  has_many :user_languages
  has_many :languages, through: :user_languages

  has_many :comments
  has_many :written_comments, class_name: "Comment", foreign_key: "writer_id"

  has_many :chats 
  has_many :chats_to, class_name: "Chat", foreign_key: "to_id"

  before_save :assign_role

  accepts_nested_attributes_for :user_languages, allow_destroy: true
  
  def assign_role
    self.role = "registered" if self.role.nil?
  end

  def role?(role)
    self.role == role
  end

  # def self.find_for_authentication(conditions)
  #   conditions[:firstname].downcase!
  #   conditions[:lastname].downcase!
  #   super(conditions)
  # end

  def all_friendships
    friendships + friendships_as_friend
  end

  def all_friends
    (friends + friends_as_friend).uniq
  end


  def self.from_omniauth(auth)
    if user = User.find_by_email(auth.info.email)
      user.provider = auth.provider
      user.uid = auth.uid
      user
    else
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.firstname = auth.info.firstname
        user.lastname = auth.info.lastname
      end
    end
  end

 


  



  
  private
  def set_default_role
    self.role ||= 'registered'
  end




end
