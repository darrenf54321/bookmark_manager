

def sign_up(email:, password:, password_confirmation:)
  visit "/"
  click_button "Register"
  fill_in :email, with: email
  fill_in :password, with: password
  fill_in :password_confirmation, with: password_confirmation
  click_button "ok"
end
