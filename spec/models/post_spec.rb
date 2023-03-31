require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: "Post 1", text: "Text 1", comments_counter: 10, author_id: 1, likes_counter: 10) }
  author  = User.new(name: "John", photo:"https://t3.ftcdn.net/jpg/02/47/40/98/360_F_247409832_pPugfgU5cKLsrH5OCJRMn5JTcy2L1Rrg.jpg", Bio:"Anything",  posts_counter: 5)

  before { subject.save }

  it 'title should be presen' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title should be less than 250 characters' do
    subject.title = "a" * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be an integer' do
    subject.comments_counter = "string"
    expect(subject).to_not be_valid
  end

  it 'comments_counter should be greater than or equal to 0' do
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be an integer' do
    subject.likes_counter = "string"
    expect(subject).to_not be_valid
  end

  it 'likes_counter should be greater than or equal to 0' do
    subject.likes_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#recent_comments' do
    before do
      10.times do |c|
        Comment.create(text: "Comment #{c}", post_id: subject.id, author_id: 1)
      end
    end
  end

  it 'should return the 5 most recent comments' do
      expect(subject.recent_comments).to eq(subject.comments.order(created_at: :desc).limit(5))
  end
  

end