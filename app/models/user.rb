class User < ApplicationRecord
  include Clearance::User
  
  has_many :messages, dependent: :destroy
  has_many :posts, dependent: :destroy # Destroy Posts if user account is deleted
end
