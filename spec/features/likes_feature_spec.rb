require 'rails_helper'

feature 'Likes' do

  before do
    sign_up
    sign_out
    sign_in
    write_post("This is my best post")
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
