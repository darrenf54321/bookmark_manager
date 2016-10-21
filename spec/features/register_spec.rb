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

  scenario "I can't sign up without an email address" do
    expect { sign_up(email: nil, password: "123", password_confirmation: "123") }.not_to change(User, :count)
  end

  scenario "I can't sign up with an invalid email address" do
    expect { sign_up(email: "invalid@email", password: "123", password_confirmation: "123") }.not_to change(User, :count)
  end
end
