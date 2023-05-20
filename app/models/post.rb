class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, numericality: { only_intger: true, greater_than_or_equal_to: 0 }
  validates :like_counter, numericality: { only_intger: true, greater_than_or_equal_to: 0 }

  after_save :update_user_post_counter

  def five_recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def update_user_post_counter
    author.increment!(:posts_counter)
  end
end
