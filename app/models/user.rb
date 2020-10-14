class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true, presence: true
  validates_presence_of :password

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships
  has_many :party_viewers, dependent: :destroy
  has_many :parties, through: :party_viewers

  def find_viewing_parties
    PartyViewer.where(user_id: self.id)
  end

  def find_movies
    movies = []
    all_viewing_parties = find_viewing_parties
    all_viewing_parties.each do |viewing_party|
      movies << Party.find(viewing_party[:party_id])
    end
    return movies
  end
end
