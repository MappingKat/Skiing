class ResortRelationship < ActiveRecord::Base
  belongs_to :instructor, class_name: "User"
  belongs_to :resort
  attr_accessible :favorite, :instructor_state
end
