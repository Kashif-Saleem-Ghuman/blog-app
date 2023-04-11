require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'Posts show page' do
    before(:each) do
      @user = User.create(name: 'Kenny',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          Bio: 'I am Rails developer',
                          posts_counter: 3)
      @user2 = User.create(name: 'Bee',
                           photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           Bio: 'I am Rails developer',
                           posts_counter: 4)
      @first_post = Post.create(author: @user, title: 'My first post', text: 'This is my first post')
      Comment.create(post: @first_post, author: @user2, text: 'This the first post comment')

      visit user_post_path(@user, @first_post)
    end

    it 'I can see the post title' do
      expect(page).to have_content(@first_post.title)
    end

    it 'I can see who wrote the post' do
      expect(page).to have_content(@first_post.author.name)
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content(@first_post.comments_counter)
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content(@first_post.likes_counter)
    end

    it 'I can see the post body' do
      expect(page).to have_content(@first_post.title)
    end

    it 'I can see the username of each commentor' do
      expect(page).to have_content(@user2.name)
    end

    it 'I can see the comment each commentor left' do
      expect(page).to have_content(@first_post.comments.first.text)
    end
  end
end
