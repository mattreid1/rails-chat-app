class User < ApplicationRecord
  include Clearance::User
  after_create :create_profile
  
  has_many :messages, dependent: :destroy
  has_many :posts, dependent: :destroy # Destroy Posts if user account is deleted
  has_one :profile, dependent: :destroy

  def create_profile
    Profile.create(:name => self.email, :user => self)
  end
end
