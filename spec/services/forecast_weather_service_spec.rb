require 'rails_helper'

RSpec.describe ForecastWeatherService do
  context '#call' do
    it 'Return a forecast weather' do
      host = "http://api.openweathermap.org/data/2.5/"
      key =  ENV['API_KEY']
      city = "Santos"

      weather_city = ForecastWeatherService.new(host, city, key).call
      
      expect(weather_city).to eq("28°C e chuva fraca em Santos em 22/11")
    end
  end
end