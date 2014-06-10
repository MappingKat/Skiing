class Profile < ActiveRecord::Base
  attr_accessible :bio, :favorite_resorts, :level, :off_piste, :picture, :state, :prefered, :user_id

  belongs_to :user
end
