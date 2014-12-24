require 'rails_helper'

feature 'Likes' do

  before do
    Post.create(content: 'A post without a picture')
  end

  scenario 'A user can like a post', js: true do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content('1 like')
  end
  
  scenario 'The number of likes is shown on the front page', js:true do
    visit '/posts'
    click_link 'Like'
    click_link 'Like'
    click_link 'Like'
    expect(page).to have_content('3 likes')
  end
    

end
