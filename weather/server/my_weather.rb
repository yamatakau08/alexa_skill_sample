# refer https://paiza.hatenablog.com/entry/2018/02/07/paizacloud_alexa_bot_ruby
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/json'
require './livedoor_forecast'

post '/endpoint' do

  WEATHERHACKS_YOKOHAMA_CITY_ID = "140010"
  weather = WeatherHacks.new(WEATHERHACKS_YOKOHAMA_CITY_ID)
  telop = weather.telop # 今日の天気

  ret = {"version": "1.0",
         "response": {"outputSpeech": {"type": "PlainText", "text": telop}}}

  return json(ret)
end

get '/' do
    return "Hello World"
end
