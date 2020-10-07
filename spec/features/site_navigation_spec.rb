require "rails_helper"

RSpec.describe "Site Navigation", type: :feature do
  describe "As a visitor" do
    it "I Can see the welcome page" do
      visit '/'
      expect(page).to have_content("Welcome to Viewing Party!")
      expect(page).to have_button("Login")
      expect(page).to have_link("New to Viewing Party? Register Here")
    end

  end
end
