require 'rails_helper'

RSpec.describe 'Posts', type: :system do
  describe 'Posts index page' do
    before(:each) do
      @user = User.create(name: 'Harry',
                          photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                          Bio: 'I am a Full Stack Developer',
                          posts_counter: 2)
      @user2 = User.create(name: 'Potter',
                           photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                           Bio: 'I am a Full Stack Developer',
                           posts_counter: 4)
      @first_post = Post.create(author: @user, title: 'My first post', text: 'This is my first post')
      Comment.create(post: @first_post, author: @user2, text: 'This the comment for the first post')

      visit user_posts_path(@user)
    end

    it "I can see the user's profile picture." do
      expect(page.body).to include(@user.photo)
    end

    it "I can see the user's username" do
      expect(page).to have_content(@user.name)
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content(@user.posts_counter)
    end

    it "I can see a post's title." do
      expect(page).to have_content(@first_post.title)
    end

    it "I can see some of the post's body." do
      expect(page).to have_content(@first_post.title)
    end

    it 'I can see the first comments on a post' do
      expect(page).to have_content('This the comment for the first post')
    end

    it 'I can see the first comments on a post' do
      expect(page).to have_content('This the comment for the first post')
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content(@first_post.comments_counter)
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content(@first_post.likes_counter)
    end

    it 'I can see a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('Pagination')
    end

    it "When I click on a post, it redirects me to that post's show page." do
      click_link(@first_post.title)
      expect(page).to have_current_path(user_post_path(@user, @first_post))
    end
  end
end
