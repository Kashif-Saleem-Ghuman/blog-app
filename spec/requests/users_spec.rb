require 'rails_helper'

RSpec.describe '/Users', type: :request do
  describe 'Get/index' do
    before(:example) do
      get '/users'
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end
    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end
    it 'contains the correct text' do
      expect(response.body).to include('Here is a list of all users')
    end
  end

  describe 'Get/show' do
    before(:example) do
      get '/users/1'
    end
    it 'renders a successful response' do
      expect(response).to be_successful
    end
    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end
    it 'contains the correct text' do
      expect(response.body).to include('Here are the detials about User XYZ')
    end
  end
end
