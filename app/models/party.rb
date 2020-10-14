class Party < ApplicationRecord
  has_many :party_viewers, dependent: :destroy
  has_many :users, through: :party_viewers
end
