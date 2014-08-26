

require 'rails_helper'

describe 'maps' do
  before do
    chloe = User.create(email: 'chloe@gmail.com', password: '12345678', password_confirmation: '12345678')
    login_as chloe
    chloe.posts.create(title: 'Post with address', address: '25 City Road, London')
  end

  it 'displays a map when the Map button is clicked', js: true do
    visit '/posts'
    click_link 'Map'

    # Testing for presence of a Google Maps map
    expect(page).to have_css '.gm-style'
  end
end