require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    @user = User.create(name: 'Mike Jones', photo: 'https://unsplash.com/photos/RGKJOUFH0',
                        bio: 'Love ME, maybe!')
  end
  describe 'validations' do
    it 'should validate the presence of name' do
      @user.name = nil
      expect(@user.errors.any?).to eq(true)
    end

    it 'should validate numericality of posts_counter' do
      @user.posts_counter = 'Microverse'
      expect(@user.errors.any?).to eq(true)
    end

    it 'should validate if post counter is a positive integer' do
      @user.posts_counter = -5
      expect(@user).to_not be_valid
    end
  end

  describe 'associations' do
    it 'should have many posts' do
      expect(@user.posts).to eq([])
    end

    it 'should have many comments' do
      expect(@user.comments).to eq([])
    end

    it 'should have many likes' do
      expect(@user.likes).to eq([])
    end
  end

  describe 'recent posts by user' do
    it 'should return the 3 most recent posts' do
      4.times do |i|
        Post.create(author: @user, title: "Post #{i}", text: "Here is the content of Post #{i}")
      end
      expect(@user.last_three_posts).to eq(@user.posts.order(created_at: :desc).limit(3))
    end
  end
end