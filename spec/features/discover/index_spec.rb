require 'rails_helper'

RSpec.describe "Discover Page" do
  before :each do
    @user = User.create(email: "email@email.com", password: "password")
    @user2 = User.create(email: "email2@email.com", password: "password")
    @user3 = User.create(email: "email3@email.com", password: "password")
    visit '/'

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_on "Login"
    click_on "Discover Movies"
  end

  it 'can click discover to 40 movies button and directs us to movies page with list of movies' do
    expect(current_path).to eq('/discover')
    click_on "Discover Top 40 Movies"
    expect(current_path).to eq('/movies')
  end
end
