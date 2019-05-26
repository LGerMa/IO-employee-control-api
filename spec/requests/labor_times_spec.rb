require 'rails_helper'

RSpec.describe 'Labor Time', type: :request do
  describe 'POST /api/v1/labor_times' do
    let!(:user) { create(:user) }
    let!(:valid_token) { get_token(user.id) }
    let!(:valid_header) { get_headers(valid_token.token)}
    context 'create a new labor time' do
      before {
        post '/api/v1/labor_times', headers: valid_header
      }
      it 'create a valid labor time' do
        expect(response).to have_http_status(:created)
        expect(json).not_to be_empty
      end
    end
  end
end