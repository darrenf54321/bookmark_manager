require 'spec_helper'

feature "user sign-up" do
  scenario "the user registers with a password and password confirmation" do
    sign_up(email: "batman@hotmail.com", password: "123", password_confirmation: "123")
    expect(page).to have_content "Welcome batman@hotmail.com"
  end

  scenario 'with a password that does not match' do
    expect { sign_up(email: "cat@hotmail.com", password: "123", password_confirmation: "456")}.not_to change(User, :count)
    expect(current_path).to eq('/register')
    expect(page).to have_content 'Password and confirmation password do not match'
  end


end
