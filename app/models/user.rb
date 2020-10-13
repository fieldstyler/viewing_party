class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates :password, require: true, presence: true

  has_many :friendships
  has_many :friends, through: :friendships
end
