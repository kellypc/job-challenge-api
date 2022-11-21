require 'rails_helper'

describe "get weather route to Aracaju", :type => :request do
  context 'When the params exist' do
    ENV["API_KEY"] = "dd3e1ec30db7ce17ff47278bc8c92a36"

    before { post '/api/v1/weather/send_forecast_weather', params: {"city":"Aracaju"} }  

    it 'returns weather' do
      expect(JSON.parse(response.body)['name']).to eq('Aracaju')
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(:success)
    end
  end
end