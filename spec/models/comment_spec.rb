require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :all do
    @user = User.create(name: 'Jude Bell', photo: 'image.jpg', bio: 'Spontaneuos human.')
        @user.save
        @post = Post.create(author: @user, title: 'Hello world', text: 'My first Post')
    @post.save
    @comment = Comment.create(author: @user, post: @post, text: 'Hello world comment')
  end

    it 'should belong to a user' do
      expect(@comment.author).to eq(@user)
    end

    it 'should belong to a post' do
      expect(@comment.post).to eq(@post)
    end
end