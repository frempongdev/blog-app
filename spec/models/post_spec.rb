require 'rails_helper'

RSpec.describe Post, type: :model do
    before :all do
        @user = User.create(name: 'Jude Bell', photo: 'image.jpg', bio: 'Spontaneuos human.')
        @user.save
        @post = Post.create(author: @user, title: 'Hello world', text: 'My first Post')
    end 

    describe 'All Validation' do
        it 'should validate that title is present' do
          @post.title = nil
          expect(@post.errors.any?).to eq(true)
        end
    
        it 'should check if length of the title is less than 250 characters' do
          @post.title = 'Front-End' * 28
          expect(@post).to_not be_valid
        end
    
        it 'should check if comments_counter is an integer >= 0' do
          @post.comments_counter = 'Number'
          expect(@post).to_not be_valid
        end
    
        it 'should check if likes_counter is an integer >= 0' do
            @post.like_counter = 'Number'
          expect(@post).to_not be_valid
        end
      end

      describe 'All Associations' do
        it "Should check association with User model" do
            expect(@post.author).to eq(@user)
        end

        it 'should have many comments' do
          expect(@post.comments).to eq([])
        end
    
        it 'should have many likes' do
          expect(@post.likes).to eq([])
        end
      end

    describe 'recent comments' do
        it 'should return the 5 most recent comments for a given post' do
          6.times do |i|
            Comment.create(author: @user, post: @post, text: "Comment #{i}")
          end
          expect(@post.five_recent_comments).to eq(@post.comments.order(created_at: :desc).limit(5))
        end
    end
end 