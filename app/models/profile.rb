class Profile < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :user_id, presence: true, uniqueness: true, numericality: true
  validates :name, presence: true, length: { maximum: 40 }
  validates :student, presence: true

  scope :profile_info, ->(user) {where(["user_id = ?", user.id])}
end
