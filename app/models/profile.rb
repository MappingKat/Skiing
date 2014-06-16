class Profile < ActiveRecord::Base
  attr_accessible :bio, :favorite_resorts, :level, :off_piste, :profile_picture, :state, :prefered, :user_id, :speciality_ids, :resort_ids, :resorts
  attr_reader :resort

  belongs_to :user
  mount_uploader :profile_picture, ProfilePictureUploader

  has_many :profile_specialities
  has_many :specialities, through: :profile_specialities

  has_many :profile_resorts
  has_many :resorts, through: :profile_resorts

  def resort=(ids)
    self.resort_ids = ids.split(", ")
  end

end
