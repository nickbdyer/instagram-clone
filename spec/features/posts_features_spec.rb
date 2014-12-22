require 'rails_helper'

feature 'Posts' do
  context 'when no posts exist' do

    scenario 'should show a link for making a post' do
      visit '/posts'
      expect(page).to have_content("There are no posts yet")
      expect(page).to have_link("Add Post")
    end
  end

  context 'when a post exists' do

    before do
      Post.create(content: "Hey check this out!")
    end

    scenario 'should show the posts' do
      visit '/posts'
      expect(page).to have_content("Hey check this out!")
      expect(page).not_to have_content("There are no posts yet")
    end
  end

  context 'when a user fills out a form to make a post' do

    scenario 'they should see that post' do
      visit '/posts'
      click_link 'Add Post'
      fill_in 'Content', with: 'Hey everyone come see my post'
      click_button 'Create Post'
      expect(page).to have_content("Hey everyone come see my post")
      expect(current_path).to eq '/posts'
    end
  end

end

