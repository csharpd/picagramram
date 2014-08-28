require 'rails_helper'

describe 'deleting posts' do
  before do
        @chloe = User.create(email: 'chloe@gmail.com', password: '12345678', password_confirmation: '12345678')
        login_as @chloe
        @chloe.posts.create(title: 'A cool pic')
  end
  context 'Logged in as post creator' do
    before do
      login_as @chloe
    end

    it 'deletes the post' do
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content "A cool pic"
    end
  end

  context 'Logged in as another user' do
    before do
        fred = User.create(email: 'fred@gmail.com', password: '12345678', password_confirmation: '12345678')
        login_as fred
  end
    it 'displays an error message' do
      visit '/posts'
      click_link 'Delete'
      expect(page).to have_content "Can't delete - not your post"
      expect(page).to have_content "A cool pic"
    end
  end
end