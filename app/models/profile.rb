class Profile < ActiveRecord::Base
  attr_accessible :bio, :favorite_resorts, :level, :off_piste, :profile_picture, :state, :prefered, :user_id

  belongs_to :user
  mount_uploader :profile_picture, ProfilePictureUploader
end
