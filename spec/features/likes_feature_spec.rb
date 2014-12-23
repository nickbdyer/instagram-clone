require 'rails_helper'

feature 'Likes' do

  before do
    Post.create(content: 'A post without a picture')
  end

  scenario 'A user can like a post' do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end

end