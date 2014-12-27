require 'rails_helper'
require_relative '../helpers/posts_helper'

RSpec.describe PostsController, :type => :controller do

@post = Post.create(content: "Test post", id: 1)

  context 'during simulated requests' do

    it 'posts cannot be edited' do
      put :update, {:id => @post, :content => "Bullshit"}
      expect(page).to have_content "Only the post owner can edit this post"
    end
  end
end
