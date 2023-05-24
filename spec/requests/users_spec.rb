require 'rails_helper'

RSpec.describe 'GET /users', type: :request do
  it ' returns http status ok for /users' do
    get users_path
    expect(response.status).to eq(200)
    expect(response.status).not_to eq(404)
  end

  it 'renders the index template for users controller' do
    get users_path
    expect(response).to render_template(:index)
  end

  it 'displays index content for users controller' do
    get users_path
    expect(response.body).to include('all Users')
  end
end

RSpec.describe 'GET /users/:id', type: :request do
  let(:user) { User.create!(name: 'John Doe', photo: 'https://example.com/photo.jpg', bio: 'Hello, I am John Doe', posts_counter: 5) }

  it ' returns http status ok for /user/:id' do
    get users_path user.id
    expect(response.status).to eq(200)
    expect(response.status).not_to eq(404)
  end

  it 'renders the show template for users controller' do
    get user_path(user.id)
    expect(response).to render_template(:show)
  end

  it 'displays show content for a user' do
    get user_path(user.id)
    expect(response.body).to include('list of posts for a given user')
  end
end
