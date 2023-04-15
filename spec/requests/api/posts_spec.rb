require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do

  path '/api/users/{user_id}/posts' do
    # You'll want to customize the parameter types...
    parameter name: :user_id, in: :path, type: :string, description: 'user_id'

    get('list posts') do
      tags 'Posts'
      consumes 'application/json'
      security [Bearer: []]
      let(:Authorization) { auth_header(user) }

      response(200, 'successful') do
          after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end