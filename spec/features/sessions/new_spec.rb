require "rails_helper"

RSpec.describe "Login feature", type: :feature do
  describe "As a visitor" do
    before :each do
      @user = User.create(email: "email@email.com", password: "password")
      visit '/'
    end
    it "I can login" do
      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      click_on "Login"

      expect(current_path).to eq('/dashboard')
    end

    it "I cannot log in with bad credentials" do
      fill_in :email, with: @user.email
      fill_in :password, with: 'blar'
      click_on "Login"
      expect(page).to have_content('')
    end

  end
end
