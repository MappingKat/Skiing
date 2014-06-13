class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:twitter, :facebook]

  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role, :uid, :provider, :flaggable, :flagger, :flag

  has_one :profile , dependent: :destroy
  has_many :resort_relationships, foreign_key: :instructor_id
  has_many :comments, dependent: :destroy

  make_flagger
  acts_as_voter


  after_create :create_profile

  def self.from_omniauth(auth)
    twitter_email = if auth.info.nickname then auth.info.nickname.downcase + "@twitter.com" end
     
    if user = User.find_by_email(auth.info.email) || user = User.find_by_email(twitter_email) 
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.nickname
      user
    else
      
      if auth.provider == "twitter"
          test = User.create({
              :provider => auth.provider,
              :uid => auth.uid,
              :name => auth.info.nickname,
              :email => auth.info.nickname.downcase + "@twitter.com",
              :password => Devise.friendly_token[0,20]
          })
          
      else
        where(auth.slice(:provider, :uid)).first_or_create do |user|
            user.provider = auth.provider
            user.uid = auth.uid
            user.name = auth.info.nickname
            user.email = auth.info.email
            user.password = Devise.friendly_token[0,20]
        end
      end 
    end
  end

  private
  def create_profile
    unless profile
      build_profile 
      profile.save
    end
  end

end
