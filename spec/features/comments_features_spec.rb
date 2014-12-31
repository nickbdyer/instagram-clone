require 'rails_helper'
require_relative '../helpers/posts_helper.rb'

feature 'Comments' do
    before do
      sign_up
      sign_out
      sign_in
      write_post("This is my best post")
    end

  scenario 'allows users to leave comments on posts' do
    visit '/posts'
    click_link 'Comment'
    fill_in 'Comment', with: "No it isn't"
    click_button 'Create Comment'

    expect(current_path).to eq '/posts'
    expect(page).to have_content("No it isn't")
  end

  scenario 'users emails are associated with their comments' do
    sign_out
    user_two_sign_in
    visit '/posts'
    click_link 'Comment'
    fill_in 'Comment', with: "No it isn't"
    click_button 'Create Comment'
    expect(page).to have_content("No it isn't")
    expect(page).to have_content("test@test.com")
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

