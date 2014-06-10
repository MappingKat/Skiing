class Speciality < ActiveRecord::Base
  attr_accessible :name

  has_many :profile_specialities
  has_many :profiles, through: :profile_specialities
end
