require 'rails_helper'
require_relative '../helpers/posts_helper'

feature 'Posts' do

    before do
      sign_up
      sign_out
      user_two_sign_up
      sign_out
    end

  context 'when no posts exist' do

    scenario 'should show a link for making a post' do
      visit '/posts'
      expect(page).to have_content("There are no posts yet")
      expect(page).to have_link("Add Post")
    end
  end

  context 'when a post exists' do

    before do
      sign_in
      write_post("Hey check this out!")
    end

    scenario 'should show the posts' do
      visit '/posts'
      expect(page).to have_content("Hey check this out!")
      expect(page).not_to have_content("There are no posts yet")
    end
  end

  context 'when a user fills out a form to make a post' do

    scenario 'they should see an error message if they aren\'t logged in' do
      visit '/posts'
      click_link 'Add Post'
      expect(page).to have_content "You need to sign in" +
                                    " or sign up before continuing."
    end

    scenario 'they should see that post and their username should be displayed' do
      sign_in
      visit '/posts'
      click_link 'Add Post'
      fill_in 'Content', with: 'Hey everyone come see my post'
      click_button 'Create Post'
      expect(page).to have_content("Hey everyone come see my post")
      expect(page).to have_content("by test@example.com")
      expect(current_path).to eq '/posts'
    end

  end

  context 'uploading photos' do

    scenario 'users can make posts with images' do
      sign_in
      visit '/posts'
      click_link 'Add Post'
      fill_in 'Content', with: 'Check this out'
      attach_file('Image', "#{Rails.root}/spec/support/images/example.jpg")
      click_button 'Create Post'
      expect(page).to have_content("Check this out")
      expect(page).to have_xpath("//img[contains(@src,\"example.jpg\")]")
      expect(current_path).to eq '/posts'
    end
  end

  context 'viewing posts' do

    before do
      sign_in
      write_post("Test Post")
    end

    let!(:test){Post.find_by(content: 'Test Post')}

    scenario 'when clicking on a post, that post should become visible' do
      visit '/posts'
      click_link 'Test Post'
      expect(page).to have_content("Test Post")
      expect(current_path).to eq "/posts/#{test.id}"
    end
  end

  context 'editing posts' do

    before do
      sign_in
      write_post("This is a test post")
    end

    let!(:test){Post.find_by(content: 'This is a test post')}

    scenario 'users can edit posts' do
      visit '/posts'
      click_link 'Edit'
      fill_in 'Content', with: 'This is an edited test post'
      click_button 'Update Post'
      expect(page).to have_content("This is an edited test post")
      expect(current_path).to eq '/posts'
    end

    scenario 'users cannot edit other peoples posts' do
      sign_out
      user_two_sign_in
      visit '/'
      expect(page).not_to have_content 'Edit'
    end

    scenario 'users cannot simulate an edit request to others posts' do
      sign_out
      user_two_sign_in
      visit '/'
      page.driver.put("posts/1", content: "I am changing the post")
      expect(page.driver.status_code).to eq 302
      visit '/'
      expect(page).to have_content "This is a test post"
    end

  end

  context 'deleting posts' do

    before do
      sign_in
      write_post("This is a test post")
    end

    let!(:test){Post.find_by(content: 'This is a test post')}

    scenario 'users can delete posts' do
      visit '/posts'
      click_link 'Delete'
      expect(page).not_to have_content("This is a test post")
      expect(page).to have_content("Post successfully deleted")
      expect(current_path).to eq '/posts'
    end

    scenario 'users cannot delete other peoples posts' do
      sign_out
      user_two_sign_in
      visit '/'
      expect(page).not_to have_content 'Delete'
    end

  end
end

