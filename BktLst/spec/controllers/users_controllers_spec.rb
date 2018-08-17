require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe 'GET #new' do
    it 'renders the new user' do
      get :new
      expect(response).to render_template :new
    end
  end


  describe 'GET #index' do
    it 'renders the index page' do
      get :index
      expect(response).to render_template :index
    end
  end

    describe "GET #show" do
    let(:darren) {create(:user)}

    it "renders the show template" do
      get :show, params: { id: darren.id }
      expect(response).to render_template(:show)
    end
  end


  context 'with invalid params' do
  it 'validates the presence of name and username' do
    post :create, params: { user: { username: 'this is an invalid link' } }
    expect(response).to render_template('new')
    expect(flash[:errors]).to be_present
  end
end

context 'with valid params' do
  it 'redirects to the link show page' do
    post :create, params: { user: { username: 'Claire', name: 'Claire', password: 'starwars'} }
    expect(response).to render_template(:show)
  end
end

end
