require_relative 'spec_helper'

feature 'user signup' do

  scenario 'it allows a user to signup' do
    visit '/'
    click_button 'register'
    fill_in 'name', with: 'Delia Smith'
    fill_in 'email', with: 'delia@hotmail.com'
    click_button 'ok'
    expect(page).to have_content('Welcome Delia!!')
    end
  end
