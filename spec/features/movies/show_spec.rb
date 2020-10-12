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

    xit "I can visit movies index page and click on a movie title link to see the movie details" do
      click_on "Discover Top 40 Movies"
      click_on "Gabriel's Inferno"
      expect(page).to have_content("Gabriel's Inferno")
      expect(page).to have_content("Vote average: 8.9")
      expect(page).to have_content("Romance")
      expect(page).to have_content("Runtime: 122")
      expect(page).to have_content("Overview: An intriguing and sinful exploration of seduction, forbidden love, and redemption, Gabriel's Inferno is a captivating and wildly passionate tale of one man's escape from his own personal hell as he tries to earn the impossible--forgiveness and love.")
      expect(page).to have_content("Movie Cast:")
      expect(page).to have_content("Melanie Zanetti")
      expect(page).to have_content("Giulio Berruti")
    end

    it "can display multiple genres" do
      click_on "Discover Top 40 Movies"
      click_on "Parasite"
      expect(page).to have_content("Comedy")
      expect(page).to have_content("Thriller")
      expect(page).to have_content("Drama")
    end

  end
end
