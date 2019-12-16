class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :user_id, presence: true, uniqueness: true
  validates :name, presence: true
  validates :student, presence: true

  scope :profile_info, ->(user) {where(["user_id = ?", user.id])}
end
