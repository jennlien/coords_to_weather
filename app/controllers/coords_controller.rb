require 'open-uri'
require 'json'

class CoordsController < ApplicationController
   def new_location
    @new_location = params[:new_lat]
    @new_longitude = params[:new_longitude]
   end

  def fetch_weather
    @latitude = params[:new_lat]
    @longitude = params[:new_longitude]
    your_api_key = "aeda1113573c6d043a9f8e224144eb3e"

    # Your code goes here.
    url = "https://api.forecast.io/forecast/aeda1113573c6d043a9f8e224144eb3e/#{@latitude},#{@longitude}"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @temperature = parsed_data["currently"]["temperature"]
    @minutely_summary = parsed_data["minutely"]["summary"]
    @hourly_summary = parsed_data["hourly"]["summary"]
    @daily_summary = parsed_data["daily"]["summary"]

  end
end
