require 'rails_helper'

feature 'Comments' do
  before {Post.create content: 'This is my best post'}

  scenario 'allows users to leave comments on posts' do
    visit '/posts'
    click_link 'Comment'
    fill_in 'Comment', with: "No it isn't"
    click_button 'Submit'

    expect(current_path).to eq '/posts'
    expect(page).to have_content("No it isn't")
  end

end

