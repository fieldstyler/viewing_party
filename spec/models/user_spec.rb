require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
    it {should validate_uniqueness_of(:email)}
  end

  describe 'relationships' do
    it {should have_many(:party_viewers)}
    it {should have_many(:parties).through(:party_viewers)}
  end

  it "can be created" do
    user = User.create(email: "sam@email.com", password: 'pass', password_confirmation: 'pass')
  end
end
