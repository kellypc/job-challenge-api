require 'net/http'
require 'net/https'
require 'open-uri'
require 'json'

class ForecastWeatherService
  attr_accessor :host, :city, :key

  def initialize(host, city, key)
    @host = host
    @city = city
    @key = key  
  end

  def call
    api_request_city_weather
  end

  private

  def api_request_city_weather
    url_weather = host + 'weather?q=' + city + '&appid=' + key + '&lang=PT' + '&units=metric'
    uri = URI.parse(url_weather)
    http = Net::HTTP.new(uri.host, uri.port)
    request = Net::HTTP::Post.new(uri.request_uri)
    
    response = http.request(request)

    content = JSON.parse(response.body)

    filter_response(content)
  end

  def filter_response(content)
    weather_condition = content['weather'][0]['description']
    temperature = content['main']['temp']
    city = content['name']
    date = content['dt']
    "#{temperature.ceil}°C e #{weather_condition} em #{city} em #{Time.at(date).strftime("%d/%m")}"
  end
end
