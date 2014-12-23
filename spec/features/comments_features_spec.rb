require 'rails_helper'

feature 'Comments' do
  before {Post.create content: 'This is my best post'}

  scenario 'allows users to leave comments on posts' do
    visit '/posts'
    click_link 'Comment'
    fill_in 'Comment', with: "No it isn't"
    click_button 'Create Comment'

    expect(current_path).to eq '/posts'
    expect(page).to have_content("No it isn't")
  end

  context 'when a post is deleted' do

    scenario 'the comments are also deleted' do
      visit '/posts'
      click_link 'Comment'
      fill_in 'Comment', with: "No it is not"
      click_button 'Create Comment'
      expect(page).to have_content("No it is not")
      click_link 'Delete'
      expect(page).not_to have_content("No it is not")
    end
  end
      
end

