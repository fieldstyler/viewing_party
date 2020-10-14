require 'rails_helper'

RSpec.describe Party, type: :model do
  describe "relationships" do
    it {should have_many(:party_viewers)}
    it {should have_many(:users).through(:party_viewers)}
  end
end
