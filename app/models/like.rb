# == Schema Information
#
# Table name: likes
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  fan_id     :integer
#  photo_id   :integer
#

class Like < ApplicationRecord
  validates(:fan, { :presence => true })
  validates(:photo, { :presence => true })
  validates(:photo_id, { 
    :uniqueness => { :scope => [:fan_id] }
  })

  # Association accessor methods to define:
  
  ## Direct associations

  # Like#fan: returns a row from the users table associated to this like by the fan_id column
  belongs_to(:fan, class_name: "User", foreign_key: "fan_id", primary_key: "id")

  # Like#photo: returns a row from the photo table associated to this like by the photo_id column
  belongs_to(:photo, class_name: "Photo", foreign_key: "photo_id", primary_key: "id")
end
