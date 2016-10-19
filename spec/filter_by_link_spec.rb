require_relative 'spec_helper'

feature 'Tag filter' do
  scenario 'it filters by tags' do
    Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    visit '/links/new'
    fill_in 'title', with: 'Bubble Smith'
    fill_in 'url', with: 'http://http://www.deliaonline.com'
    fill_in 'tags', with: 'Bubbles'
    click_button 'Add'
    fill_in 'filter', with: 'Bubbles'
    click_button 'Filter'
    expect(page.status_code).to eq(200)
    within 'ul#links' do
      expect(page).to have_content('Title: Bubble Smith')
      expect(page).not_to have_content('Title: Makers Academy')
    end
  end

  scenario 'Multiple tags' do
    # Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy', tags: [Tag.first_or_create(name: 'education')])
    visit '/links/new'
    fill_in 'title', with: 'Bubble Smith'
    fill_in 'url', with: 'http://http://www.deliaonline.com'
    fill_in 'tags', with: 'Bubbles News Food'
    click_button 'Add'
    link = Link.first
    expect(link.tags.map(&:name)).to include('Bubbles', 'News', 'Food')
end
end
