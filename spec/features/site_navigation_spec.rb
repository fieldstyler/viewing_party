require "rails_helper"

RSpec.describe "Site Navigation", type: :feature do
  describe "As a visitor" do
    before :each do
      @user = User.create(email: "email@email.com", password: "password")
    end

    it "I Can see the welcome page" do
      visit '/'
      expect(page).to have_content("Welcome to Viewing Party!")
      expect(page).to have_button("Login")
      expect(page).to have_link("New to Viewing Party? Register Here")
    end

    it 'can login' do
      visit '/'
      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      click_on "Login"
      expect(current_path).to eq('/dashboard')
    end

  end
end
