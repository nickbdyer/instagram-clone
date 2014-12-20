require 'rails_helper'

feature 'Posts' do
  context 'when no posts exist' do

    scenario 'should show a link for making a post' do
      visit '/posts'
      expect(page).to have_content("There are no posts yet")
      expect(page).to have_link("Add Post")
    end
  end
end

