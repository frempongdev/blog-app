require 'rails_helper'
RSpec.describe 'Renders users Show Page', type: :feature do
  before(:each) do
    # Create necessary objects for the tests, such as a user and their posts
    @user = User.create(name: 'James', photo: 'image.jpg', bio: 'Prefessor in French', posts_counter: 5)
    Post.create(author: @user, title: 'Hello mates', text: 'adipiscing elit sed eiusmod labore magna')
    Post.create(author: @user, title: 'Best Regards', text: 'tempor incididunt sit do labore consectetur')
    Post.create(author: @user, title: 'New Post', text: 'ipsum dolore et consectetur sit tempor')
    @post = Post.create(author: @user, title: 'One Post', text: 'I am getting anxious')
  end
