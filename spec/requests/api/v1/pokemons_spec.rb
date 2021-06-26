require 'rails_helper'

RSpec.describe "Api::V1::Pokemons", type: :request do
  describe "GET /index" do
    it 'should get all database pokemons' do
      get '/api/v1/pokemons'
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /show" do
    it 'should show pokemon using id' do
      params = 1
      get "/api/v1/pokemons/#{params}"
      expect(response).to have_http_status(200)
    end
    it 'should show pokemon using id' do
      params = 'pikachu'
      get "/api/v1/pokemons/#{params}"
      expect(response).to have_http_status(200)
    end
  end
end
