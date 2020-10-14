class Party < ApplicationRecord
  validates_presence_of :party_date, require: true
  validates_presence_of :start_time, require: true
  validates_presence_of :duration, require: true
  has_many :party_viewers, dependent: :destroy
  has_many :users, through: :party_viewers
end
