require 'rails_helper'

describe 'creating posts' do
  before do
    chloe = User.create(email: 'chloe@gmail.com', password: '12345678', password_confirmation: '12345678')
  end
  context 'Logged in' do
    visit '/posts'
    click_link 'New Post'
    fill_in 'Title', :with 'Indian Summer'
    click_button 'Create Post'

    expect(page).to have_content 'Indian Summer'
    expect(current_path).to eq '/posts'
  end
  context 'Logged out' do
    visit '/posts'
    click_link 'New Post'
    expect(page).to have_content 'Sign in'
  end
end