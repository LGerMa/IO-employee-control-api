require 'rails_helper'

RSpec.describe 'OAUTH' do

  let(:user) { create(:user) }
  let(:token) { get_token(user.id, 'users') }
  # let(:headers) do
  #   { 'Authorization' => "Bearer #{token.token}" }
  # end

  describe 'Create a token' do
    it 'should create a token ' do
      p user
      p token
    end
  end
end