require 'rails_helper'
RSpec.feature 'User Post Index Page', type: :feature do
  before do
    @user = User.create(name: 'Fred', photo: 'image.jpg', bio: 'French Professor.', posts_counter: 0)
    @user.save
    @first_post = Post.create(title: 'Lets start', text: 'tempor incididunt sit do labore consectetur', author_id: @user.id)
    @second_post = Post.create(title: 'Get ready', text: 'adipiscing elit sed eiusmod labore magna', author_id: @user.id)
    Comment.create(text: 'First comment on post 1', author_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'Second comment on post 1', author_id: @user.id, post_id: @first_post.id)
    Comment.create(text: 'Comment on post 2', author_id: @user.id, post_id: @second_post.id)
  end
  scenario 'Display user post index page' do
    visit user_posts_path(@user)
    # Test: Verify user's profile picture is displayed
    expect(page).to have_css("img[src*='image.jpg']")
    # Test: Verify user's username is displayed
    expect(page).to have_content('Fred')
    # Test: Verify number of posts the user has written is displayed
    expect(page).to have_content('Number of posts')
    
  end
end