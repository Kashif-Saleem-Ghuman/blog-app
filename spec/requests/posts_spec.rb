require 'rails_helper'

RSpec.describe '/posts', type: :request do
  describe 'Get/index' do
    before(:example) do
      get '/users/1/posts'
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end
    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end
    it 'contains the correct text' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end

  describe 'Get/show' do
    before(:example) do
      get '/users/1/posts/1'
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end
    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end
    it 'contains the correct text' do
      expect(response.body).to include('Here is the post X of User Y')
    end
  end
end
