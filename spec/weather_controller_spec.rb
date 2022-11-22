require 'rails_helper'

describe "get weather route to Aracaju", :type => :request do
  context 'When the params exist' do
    before { post '/api/v1/weather/send_forecast_weather', params: {"city":"Aracaju"} }  

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end