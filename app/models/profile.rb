class Profile < ActiveRecord::Base
  attr_accessible :bio, :favorite_resorts, :level, :off_piste, :profile_picture, :state, :prefered, :user_id, :speciality_ids, :resort_ids

  belongs_to :user
  mount_uploader :profile_picture, ProfilePictureUploader

  has_many :profile_specialities
  has_many :specialities, through: :profile_specialities

  has_many :profile_resorts
  has_many :resorts, through: :profile_resorts
end
