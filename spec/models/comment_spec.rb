require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'assocations' do
    author = User.create(name: 'me', photo: 'photo', Bio: 'bio', posts_counter: 5)
    post = Post.create(author_id: author.id, title: 'Post', text: 'Text', likes_counter: 5, comments_counter: 5)
    subject { Comment.new(author_id: author.id, post_id: post.id, text: 'Hi') }

    before { subject.save }

    it 'author id should be a number' do
      subject.author_id = 'string'
      expect(subject).to_not be_valid
    end

    it 'post id should be a number' do
      subject.post_id = 'string'
      expect(subject).to_not be_valid
    end

    it 'increments comments_counter' do
      expect(post.comments_counter).to eq(5)
    end
  end
end
