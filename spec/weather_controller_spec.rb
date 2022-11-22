require 'rails_helper'

describe "get weather route to Aracaju", :type => :request do
  context 'When the params exist' do
    ENV["API_KEY"] = "26756240572498284"

    before { post '/api/v1/weather/send_forecast_weather', params: {"city":"Aracaju"} }  

    it 'returns weather' do
      expect(JSON.parse(response.body)['name']).to eq('Aracaju')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end

    it 'returns a twitter response' do
      expect(response)
    end
  end

  context 'When communicate with Twitter' do
    context 'tweet a message' do
      let(:tweet_message) { 'Tweet a message test'}
      
      it 'returns a twitter response' do
        expect(response).to eq(tweet_message)
      end
    end
  end
end