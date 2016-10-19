require_relative 'spec_helper'

feature 'Tag filter' do
  scenario 'it filters by tags' do
    visit '/links/new'
    fill_in 'title', with: 'Bubble Smith'
    fill_in 'url', with: 'http://http://www.deliaonline.com'
    fill_in 'tags', with: 'Bubbles'
    click_button 'Add'
    click_button 'Filter'
    fill_in 'filter', with: 'Bubbles'
    click_button 'Confirm'
    expect(current_path).to eq '/filter'
    within 'ul#filter' do
      expect(page).to have_content('Title: Bubble Smith')
    end
  end
end
