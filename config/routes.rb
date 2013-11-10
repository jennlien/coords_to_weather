CoordsToWeather::Application.routes.draw do
  get("/weather", { :controller => "coords", :action => "fetch_weather" })
  get("/new", { :controller => "coords", :action => "new_location" })
end
