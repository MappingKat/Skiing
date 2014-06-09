class Profile < ActiveRecord::Base
  attr_accessible :bio, :favorite_resorts, :level, :off_piste, :picture, :state, :type

  # belongs_to :user
end
