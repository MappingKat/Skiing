class ProfileSpeciality < ActiveRecord::Base
  belongs_to :profile
  belongs_to :speciality
  # attr_accessible :title, :body
end
