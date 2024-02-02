# ruby/main.rb
require 'sinatra'
require 'httparty'
require 'json'

set :port, 4567

get '/' do
  erb :index
end

post '/get_weather' do
  location = params[:location]

  # Replace 'YOUR_API_KEY' with your actual weather API key
  api_key = 'YOUR_API_KEY'
  api_url = 'https://api.weatherapi.com/v1/current.json'

  params = {
    key: api_key,
    q: location
  }

  begin
    response = HTTParty.get(api_url, query: params)
    data = JSON.parse(response.body)

    weather_info = {
      location: location,
      humidity: data['current']['humidity'],
      clear_sky: data['current']['condition']['text'],
      speed: data['current']['wind_kph'],
      date: data['location']['localtime']
    }

    erb :weather, locals: { weather_info: weather_info }

  rescue StandardError => e
    "Error fetching weather data: #{e}"
  end
end
