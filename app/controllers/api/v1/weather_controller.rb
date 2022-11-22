class Api::V1::WeatherController < ApplicationController
  def send_forecast_weather
    host = 'http://api.openweathermap.org/data/2.5/'
    key = ENV['API_KEY']
    city = params[:city]
    
    weather_city =  ForecastWeatherService.new(host, city, key).call

    tweet = TwitterService.send_tweet(weather_city)

    render json: tweet['text']
  end    
end
