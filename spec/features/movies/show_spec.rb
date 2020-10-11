require "rails_helper"

RSpec.describe "Movies Show page", type: :feature do
  describe "As a visitor" do
    before :each do
      @user = User.create(email: "email@email.com", password: "password")
      visit '/'

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      click_on "Login"
      click_on "Discover Movies"
    end

    it "I can visit movies index page and click on a movie title link to see the movie details" do
      click_on "Discover Top 40 Movies"
      click_on "Gabriel's Inferno"
      expect(page).to have_content("Gabriel's Inferno")
    end

  end
end
