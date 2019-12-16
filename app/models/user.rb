class User < ApplicationRecord
  include Clearance::User
  after_create :create_profile
  
  has_many :messages, dependent: :destroy
  has_many :posts, dependent: :destroy # Destroy Posts if user account is deleted
  has_one :profile, dependent: :destroy

  validates :email, presence: true, uniqueness: true
  validates :encrypted_password, presence: true

  def create_profile
    Profile.create(:name => self.email.partition("@").first, :user => self)
  end
end
