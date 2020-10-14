require "rails_helper"

RSpec.describe "Viewing Party", type: :feature do
  describe "As a visitor" do
    before :each do
      @user = User.create(email: "email@email.com", password: "password")
      @user2 = User.create(email: "em@email.com", password: "password")
      @user3 = User.create(email: "1@email.com", password: "password")
      visit '/'

      fill_in :email, with: @user.email
      fill_in :password, with: @user.password
      click_on "Login"
      fill_in :email, with: @user2.email
      click_on "Add Friend"
      fill_in :email, with: @user3.email
      click_on "Add Friend"
      click_on "Discover Movies"
    end

    it "I can create a new viewing party" do
      click_on "Discover Top 40 Movies"
      click_on "Gabriel's Inferno"
      click_on 'Create Viewing Party'
      expect(page).to have_field(:party_date)
      expect(page).to have_field(:start_time)
      expect(page).to have_field(:duration)

      fill_in :duration, with: 100
      fill_in :party_date, with: '10/14/2020'
      fill_in :start_time, with: '01:42 PM'
      within("#invite-friend-#{@user2.id}") do
        page.check 'friend_id[]'
      end

      within("#invite-friend-#{@user3.id}") do
        page.check 'friend_id[]'
      end

      click_on 'Create Party'

      expect(current_path).to eq('/dashboard')
    end

  end
end
