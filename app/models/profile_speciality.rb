class ProfileSpeciality < ActiveRecord::Base
  belongs_to :profile
  belongs_to :speciality
end
