# == Schema Information
#
# Table name: follow_requests
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#

class FollowRequest < ApplicationRecord
  validates(:sender, { :presence => true})
  validates(:recipient, { :presence => true })
  validates(:recipient_id, {
    :uniqueness => { :scope => [:sender_id] }
  })

  # Association accessor methods to define:
  
  ## Direct associations

  # FollowRequest#sender: returns a row from the users table associated to this follow request by the sender_id column
  belongs_to(:sender, class_name: "User", foreign_key: "sender_id", primary_key: "id")

  # FollowRequest#recipient: returns a row from the users table associated to this follow request by the recipient_id column
  belongs_to(:recipient, class_name: "User", foreign_key: "recipient_id", primary_key: "id")

  scope :accepted, -> { where(status: "accepted")}
end
