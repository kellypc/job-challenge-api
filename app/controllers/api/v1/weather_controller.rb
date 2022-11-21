class Api::V1::WeatherController < ApplicationController
  def send_forecast_weather
    @host = 'http://api.openweathermap.org/data/2.5/'
    @key =  ENV.fetch("API_KEY")

    city = params[:city]
    
    @weather_city =  ForecastWeatherService.new(@host, city, @key).call
    puts @weather_city
    weather_condition = @weather_city['weather'][0]['description']
    temperature = @weather_city['main']['temp']
    puts "#{temperature}°C e #{weather_condition}"

    render json: @weather_city
  end    
end