require 'rails_helper'

describe 'tagging posts' do
  before do
    chloe = User.create(email: 'chloe@gmail.com', password: '12345678', password_confirmation: '12345678')
    login_as chloe
  end
  it 'displays tags as links under posts' do
    visit '/posts'
    click_link 'New Post'
    fill_in 'Title', with: 'A brand new post'
    fill_in 'Tags', with: '#yolo #swag'

    click_button 'Create Post'
    save_and_open_page

    expect(page).to have_link '#yolo'
    expect(page).to have_link '#swag'
  end
end

describe 'filtering by tags' do
  before do
    chloe = User.create(email: 'chloe@gmail.com', password: '12345678', password_confirmation: '12345678')
    login_as chloe
    chloe.posts.create(title: 'Post A', tag_list: '#yolo, #swag')
    chloe.posts.create(title: 'Post B', tag_list: '#yolo, #olive')
  end

  it 'filters to show only tagged posts' do
    visit '/posts'
    click_link '#swag'
    expect(page).to have_css 'h1', text: 'Posts tagged with #swag'
    expect(page).to have_content 'Post A'
    expect(page).not_to have_content 'Post B'
  end
end