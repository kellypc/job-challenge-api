class Api::V1::WeatherController < ApplicationController
  def send_forecast_weather
    # api = OpenWeatherMap::API.new(ENV.fetch['API_KEY'], 'pt', 'metric')

    # result = api.current(params[:city], params[:date])

    # tweet = tweet_text(result)

    # render status: 201, json: {}
    @host = 'http://api.openweathermap.org/data/2.5/'
    @key =  "dd3e1ec30db7ce17ff47278bc8c92a36"

    city = params[:city]
    
    # @weather_city = ForecastWeatherService.new(host: @host, city: city, key: @key).call
    @weather_city = api_request_city_weather(@host, city, @key)
    puts @weather_city
    weather_condition = @weather_city['weather'][0]['description']
    temperature = @weather_city['main']['temp']

    puts "#{temperature}°C e #{weather_condition}"

    render json: @weather_city 
  end

  private

   def api_request_city_weather(host, city, key)
    require 'net/http'
    require 'net/https'
    require 'open-uri'
    require 'json'

    url_weather = host + 'weather?q=' + city + '&appid=' + key + '&lang=PT' + '&units=metric'
    uri = URI.parse(url_weather)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    
    response = http.request(request)

    content = JSON.parse(response.body)

    return content
  end    
end