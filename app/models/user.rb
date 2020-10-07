class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true
  validates_presence_of :email

  def unique_email?
    User.pluck(:email).include?(email)
  end
end
