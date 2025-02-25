# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :integer
#  photo_id   :integer
#

class Comment < ApplicationRecord
  validates(:commenter, { :presence => true })

  # Association accessor methods to define:
  
  ## Direct associations

  # Comment#commenter: returns a row from the users table associated to this comment by the author_id column
  belongs_to(:commenter, class_name: "User", foreign_key: "author_id", primary_key: "id")

  # Comment#photo: returns a row from the photos table associated to this comment by the photo_id column
  belongs_to(:photo, class_name: "Photo", foreign_key: "photo_id", primary_key: "id")
end
