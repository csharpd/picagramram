require 'rails_helper'

describe 'posts' do
  context 'no posts' do
    it 'displays a message' do
      visit '/posts'
      expect(page).to have_content 'No posts yet'
    end
  end

  context 'with posts' do
    before do
      Post.create(title: 'My best pic yet')
    end

    it 'displays all the posts' do
      visit '/posts'
      expect(page).to have_content 'My best pic yet'
    end
  end
end