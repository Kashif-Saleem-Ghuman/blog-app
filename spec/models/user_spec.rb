require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'John', photo: 'https://t3.ftcdn.net/jpg/02/47/40/98/360_F_247409832_pPugfgU5cKLsrH5OCJRMn5JTcy2L1Rrg.jpg', Bio: 'Anything', posts_counter: 5) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be an integer' do
    subject.posts_counter = 'string'
    expect(subject).to_not be_valid
  end

  it 'posts_counter should be greater than or equal to 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  describe '#recent_posts' do
    before do
      6.times do |p|
        Post.create(title: "Post #{p}", text: "Text #{p}", comments_counter: 10, author_id: subject.id,
                    likes_counter: 10)
      end
    end
  end

  it 'should return the 3 most recent posts' do
    expect(subject.recent_posts).to eq(subject.posts.order(created_at: :desc).limit(3))
  end
end
