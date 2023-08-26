require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe '#update_post_comments_counter' do
    it 'updates the post comments_counter attribute' do
      # Arrange
      user = User.create(name: 'Aziz')
      post = Post.create(title: 'Welcome', author: user)
      comment = Comment.create(author: user, post:)

      # Act
      comment.update_post_comments_counter

      # Assert
      expect(post.reload.comments_counter).to eq(1)
    end
  end
end
