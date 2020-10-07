require 'rails_helper'

RSpec.describe "Dashboard Page" do
  before :each do
    @user = User.create(email: "email@email.com", password: "password")
    @user2 = User.create(email: "email2@email.com", password: "password")
    @user3 = User.create(email: "email3@email.com", password: "password")
    visit '/'

    fill_in :email, with: @user.email
    fill_in :password, with: @user.password
    click_on "Login"
  end

  it 'has discover movies button that takes us to the discover movies page' do
    expect(current_path).to eq('/dashboard')

    expect(page).to have_content("Welcome #{@user.email}")

    expect(page).to have_button("Discover Movies")
    click_on "Discover Movies"
    expect(current_path).to eq('/discover')
  end

  it 'starts with no friends by default and theres a message telling me I have no friends, sad.' do
    expect(current_path).to eq('/dashboard')
    expect(page).to have_content("You have no friends!")
  end


  it 'has a friend section with a text field to enter a friends email and add friend button' do
    expect(current_path).to eq('/dashboard')
    expect(page).to have_field(:email)

    fill_in :email, with: @user2.email
    click_on "Add Friend"
    expect(page).to have_content(@user2.email)

    fill_in :email, with: @user3.email
    click_on "Add Friend"
    expect(page).to have_content(@user3.email)
  end

  it 'cannot add friend if email does not exist' do
    expect(current_path).to eq('/dashboard')
    expect(page).to have_field(:email)

    fill_in :email, with: "doesntexist@email.com"
    click_on "Add Friend"
    expect(page).to_not have_content("doesntexist@email.com")
    expect(page).to have_content("User does not exist")
  end
end
