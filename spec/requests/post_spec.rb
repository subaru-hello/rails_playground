# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  # subject do
  #   send_request
  #   response
  # end

  describe 'GET /posts' do
    let(:post) { FactoryBot.create(:post) }
    context 'when valid' do
      it do
        get '/posts'
        expect(response.status).to eq 200
      end
    end
  end

  describe 'POST /posts' do
    let(:posts) { FactoryBot.build(:post) }

    context 'when valid' do
      it do
        post '/posts', params: posts
        expect(response.status).to eq 200
      end
    end
  end
end
