class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, require: true, presence: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
end
