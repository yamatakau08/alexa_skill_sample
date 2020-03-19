# refer https://qiita.com/M-Yamashii/items/b46cefc489896601090d#livedoor-weather-web-service
require 'open-uri'
require 'json'

## for -rdebug on msys2
$stdout.sync = true

class WeatherHacks
  def initialize(city_id)
    # 横浜市
    @url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=" + city_id
  end

  def telop
    response = OpenURI.open_uri(@url,{:proxy => ENV["http_proxy"]})
    parse_text = JSON.parse(response.read)
    puts JSON.pretty_generate(parse_text) if DEBUG
    title = parse_text["title"]
    telop = parse_text["forecasts"].select {|x| x["dateLabel"] == "今日"}.first["telop"].sub("のち","のち,")
    title + "," + telop
  end
end

=begin
url = "http://weather.livedoor.com/forecast/webservice/json/v1?city=140010" # 横浜市
response = OpenURI.open_uri(url,{:proxy => ENV["http_proxy"]})
@parse_text = JSON.parse(response.read)
#puts JSON.pretty_generate(@parse_text)
$telop = @parse_text["title"] + @parse_text["forecasts"].select {|x| x["dateLabel"] == "今日"}.first["telop"]
=end

=begin
WEATHERHACKS_YOKOHAMA_CITY_ID = "140010"
weather = WeatherHacks.new(WEATHERHACKS_YOKOHAMA_CITY_ID)
pp weather.telop
=end
