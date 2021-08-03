# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ShortenUrls', type: :request do
  let(:valid_attrs) { { long_url: 'http://google.com', description: 'an url description' } }
  let(:invalid_attrs) { { long_url: '', description: 'an url description' } }

  describe 'GET /new' do
    it 'returns http success' do
      get '/shorten_urls/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'returns http success' do
      get '/shorten_urls'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /:token/info' do
    it 'renders a successful response' do
      shorten_url = ShortenUrl.create! valid_attrs
      get info_shorten_url_url(token: shorten_url.short_token)
      expect(response).to be_successful
    end
  end

  describe 'GET /:token' do
    it 'make a redirect to long url and saves a record for the accesed client ip' do
      shorten_url = ShortenUrl.create! valid_attrs
      get redirect_shorten_url_url(token: shorten_url.short_token)
      expect(response).to redirect_to(shorten_url.long_url)
      expect(shorten_url.statistics_urls.count).to eq(1)
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new ShortenUrl' do
        expect do
          post shorten_urls_url, params: { shorten_url: valid_attrs }
        end.to change(ShortenUrl, :count).by(1)
      end

      it 'redirects to the created shorten_url' do
        post shorten_urls_url, params: { shorten_url: valid_attrs }
        expect(response).to redirect_to(shorten_urls_url)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new ShortenUrl' do
        expect do
          post shorten_urls_url, params: { shorten_url: invalid_attrs }
        end.to change(ShortenUrl, :count).by(0)
      end

      it 'returns a status 422 unprocessable entity' do
        post shorten_urls_url, params: { shorten_url: invalid_attrs }
        expect(response.status).to eq(422)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested shorten_url' do
      shorten_url = ShortenUrl.create! valid_attrs
      expect do
        delete shorten_url_url(shorten_url)
      end.to change(ShortenUrl, :count).by(-1)
    end

    it 'redirects to the shorten_urls list' do
      shorten_url = ShortenUrl.create! valid_attrs
      delete shorten_url_url(shorten_url)
      expect(response).to redirect_to(shorten_urls_url)
    end
  end
end
