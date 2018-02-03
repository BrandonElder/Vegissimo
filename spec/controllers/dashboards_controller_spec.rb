require 'rails_helper'

RSpec.describe DashboardsController, type: :controller do
  let(:user) { User.create!(email: 'example@gmail.com', password: 'bagels') }

  describe 'show' do
    context 'when a user is authenticated' do
      it 'returns dashboard#show' do
        sign_in user
        get :show
        expect(response).to have_http_status(:success)
      end
    end
    context 'when a user is unauthenticated' do
      before(:each) { get :show }
      it 'does not allow an unathenticated user access' do
        expect(response).to have_http_status(302)
      end
      it 'redirects an unathenticated user to the sign in page' do
        expect(response).to redirect_to new_user_session_path
      end
      it 'sends error message to the unathenticated user' do
        expect(subject.request.flash[:alert]).to_not be_nil
      end
    end
  end
end
