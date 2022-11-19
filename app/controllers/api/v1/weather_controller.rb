class Api::V1::WeatherController < ApplicationController
  def index
  end
  
  def send_tweet
    render status: 201, json: {}
  end
end