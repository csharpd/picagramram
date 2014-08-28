require 'rails_helper'

describe 'creating posts' do
  context 'Logged out' do
    it 'prompts user sign in/up' do
      visit '/posts'
      click_link 'New Post'
      expect(page).to have_content 'sign in'
    end
  end

  context 'Logged in' do
    before do
      chloe = User.create(email: 'chloe@gmail.com', password: '12345678', password_confirmation: '12345678')
      login_as chloe
    end
    it ' can create posts via a form' do
    visit '/posts'
    click_link 'New Post'
    fill_in 'Title', with: 'Indian Summer'
    click_button 'Create Post'

    expect(page).to have_content 'Indian Summer'
    expect(page).to have_content 'Created by chloe@gmail.com'
    expect(current_path).to eq '/posts'
    end

    it 'can attach an image to a post' do
      visit '/posts'
      click_link 'New Post'
      fill_in 'Title', with: 'Indian Summer'
      attach_file 'Picture', Rails.root.join('spec/images/indiansummer.jpg')
      click_button 'Create Post'
      expect(page).to have_css 'img.uploaded-pic'
    end

    it 'displays no image if no picture is attached' do
      visit '/posts'
      click_link 'New Post'
      click_button 'Create Post'
      expect(page).not_to have_css 'img.uploaded-pic'
    end
  end
end