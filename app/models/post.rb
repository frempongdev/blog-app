class Post < ApplicationRecord
    belongs_to :author, class_name: 'User', foreign_key: :author_id
    has_many :likes
    has_many :comments
    
    after_save :update_user_post_counter

    
    def five_recent_comments
        comments.order(created_at: :desc).limit(5)
    end

    private

    def update_user_post_counter
        author.increment!(:posts_counter)    
    end
end
