require 'rails_helper'

RSpec.describe "Movies Page" do
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

  it 'can list top 40 movies ordered by descending vote average' do
    click_on "Discover Top 40 Movies"
    expect(current_path).to eq('/movies')

    within(".movies-container") do
      expect(page).to have_css('ul', :count => 40)
    end
  end

  it 'can search by keyword and list 40 movies that match that keyword' do
    within ".movies-search" do
      fill_in :keyword, with: "Dog"
      click_on "Find Movies"
    end
    expect(current_path).to eq('/movies')
    expect(page).to have_content("Dog")
    within(".movies-container") do
      expect(page).to have_css('ul', :count => 40)
    end
    save_and_open_page
  end
end
