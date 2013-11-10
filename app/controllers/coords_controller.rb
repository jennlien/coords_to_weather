require 'open-uri'
require 'json'

class CoordsController < ApplicationController
   def new_location
    @address = params[:new_location]
    @url_safe_address= URI.encode(@address)
    url = "http://maps.googleapis.com/maps/api/geocode/json?address=#{@url_safe_address}&sensor=false"
    raw_data = open(url).read
    parsed_data = JSON.parse(raw_data)
    @latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]
    @longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]
   end

  def fetch_weather
    @latitude = params[:latitude]
    @longitude = params[:longitude]
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
