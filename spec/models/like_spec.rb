require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create(name: 'Jude Bell', photo: 'image.jpg', bio: 'Spontaneuos human.')
    @user.save
    @post = Post.create(author: @user, title: 'Hello world', text: 'My first Post')
    @post.save
    @like = Like.create(author: @user, post: @post)
  end

  it 'should belong to a User' do
    expect(@like.author).to eq(@user)
  end

  it 'should belong to a Post' do
    expect(@like.post).to eq(@post)
  end
end
