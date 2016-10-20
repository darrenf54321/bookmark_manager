require 'spec_helper'

feature "user sign-up" do
  scenario "the user registers with a password" do
    visit "/"
    click_button "Register"
    expect(current_path).to eq '/register'
    fill_in :email, with: 'batman@hotmail.com'
    fill_in :password, with: 'robin'
    click_button "ok"
    expect(page).to have_content "Welcome batman@hotmail.com"

  end
end
