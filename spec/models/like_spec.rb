require 'rails_helper'

RSpec.describe Like, type: :model do

  describe 'associations' do
    author = User.create(name: 'author', photo: 'photo', Bio: 'bio', posts_counter: 2) 
     post = Post.create(title: 'title', text: 'text', comments_counter: 2, author_id: author.id, likes_counter: 2)
     subject { Like.new(author_id: 1, post_id: 1) }

     before { subject.save }

     it 'author id should be an integer' do
      subject.author_id = 'string'
      expect(subject).to_not be_valid
     end

     it 'post id should be an integer' do
      subject.post_id = 'string'
      expect(subject).to_not be_valid
     end

     it 'updates the likes counter' do
      expect(post.likes_counter).to eq(2)
     end
  end


end