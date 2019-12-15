class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy
  scope :profile_info, ->(user) {where(["user_id = ?", user.id])}
end
