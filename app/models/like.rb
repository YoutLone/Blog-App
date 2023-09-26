class Like < ApplicationRecord
  # Associations
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  # Callbacks
  after_save :update_post_likes_counter

  # Methods
  def update_post_likes_counter
    post.update(likes_counter: post.likes.count)
  end
end