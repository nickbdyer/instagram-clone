require 'rails_helper'
require_relative '../helpers/posts_helper'

RSpec.describe PostsController, :type => :controller do

  context 'during simulated requests' do
    before do
      User.create(email: "test@test.com", password: "testtest", password_confirmation: "testtest", id: 9)
      Post.create(content: "Test post", user_id: 9)
    end

    it 'posts cannot be edited' do
      @post = Post.find_by(:content => "Test post")
      patch :update, {:id => @post, :content => "Bullshit"}
      expect(page).to have_content "Only the post owner can edit this post"
    end
  end
end
