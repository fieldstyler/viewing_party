require "rails_helper"

RSpec.describe "CONTROLLER_TEST", type: :feature do
  describe "As a visitor" do
    it "I can click on registration link and directed to registration page" do
      visit '/'
      click_link "New to Viewing Party? Register Here"
      expect(current_path).to eq('/registration')

      fill_in :email, with: "123@email.com"
      fill_in :password, with: "password"
      fill_in :password_confirmation, with: "password"
      click_on "Submit"
      expect(current_path).to eq("/dashboard")
    end

  end
end
