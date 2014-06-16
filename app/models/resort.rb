class Resort < ActiveRecord::Base
  attr_accessible :area, :area_id, :button_max_temp_fahrenheit, :button_min_temp_fahrenheit, :top_max_temp_fahrenheit, :top_min_temp_fahrenheit, :button_max_temp, :button_min_temp, :top_max_temp, :top_min_temp, :chance_of_snow, :total_snow_fall, :avalanche_warning, :country, :daily_pass_adults, :daily_pass_kids, :day_max_temp, :day_min_temp, :day_weather_description, :forecast_date, :image, :lift_status, :map, :name, :night_grooming, :night_max_temp, :night_min_temp, :night_weather_description, :region, :resort_status, :resort_type, :six_days_pass_adults, :six_days_pass_kids, :snow_last_48hours, :surface_conditions, :weather_forecast, :website, :latitude, :longitude, :lift_count, :run_count, :day_zero_day_title, :day_zero_day_text, :day_one_day_title, :day_one_day_text, :day_two_day_title, :day_two_day_text, :day_three_day_title, :day_three_day_text, :day_four_day_title, :day_four_day_text, :day_five_day_title, :day_five_day_text, :day_six_day_title, :day_six_day_text, :day_seven_day_title, :day_seven_day_text, :day_zero_night_title, :day_zero_night_text, :day_one_night_title, :day_one_night_text, :day_two_night_title, :day_two_night_text, :day_three_night_title, :day_three_night_text, :day_four_night_title, :day_four_night_text, :day_five_night_title, :day_five_night_text, :day_six_night_title, :day_six_night_text, :icon_day_zero, :icon_day_one, :icon_day_two, :icon_day_three, :icon_day_four, :icon_day_five, :icon_day_six, :icon_night_zero, :icon_night_one, :icon_night_two, :icon_night_three, :icon_night_four, :icon_night_five, :icon_night_six

  acts_as_votable
  acts_as_commentable

  has_many :resort_relationships
  has_many :instructors, through: :resort_relationships
 
  validates :area_id, uniqueness: true
  validates :name, uniqueness: true


  def self.find_or_update(id)
    resort = self.find_by_id(id)
    if resort 
      if resort.requested
        resort
      else 
        resort.search_skiarea
        resort
      end
    else
      nil
    end
  end

  def self.request_weather(id)
    resort = self.find_by_id(id)
    if resort 
      # if resort.updated_within_24_hours?
      #   resort
      # else
        resort.request_weather_data
        resort.request_weather_forecast
        resort
      # end
    else
      nil
    end
  end

  def search_skiarea
    url = "http://www.skimap.org/SkiAreas/view/#{area_id}.json"
    response = HTTParty.get(url)
  
    self.website = response['official_website'] rescue nil
    self.latitude = response['latitude'] rescue nil
    self.longitude = response['longitude'] rescue nil
    self.lift_count = response['lift_count'] rescue nil
    self.run_count = response['run_count'] rescue nil
    
    skimap_code = response['ski_maps'].first['id']
    map_url = "http://www.skimap.org/SkiMaps/view/#{skimap_code}.xml"
    map_response = HTTParty.get(map_url)
    self.map = map_response['skiMap']['thumbnail'].last['url']

    self.requested = true

    save
  end

  def request_weather_data
    url = "http://api.worldweatheronline.com/free/v1/ski.ashx?q=#{latitude}%2C#{longitude}&format=json&key=1eda0e7c99efe8aa8d7440eb652805adf4cd0e2b"
    response = HTTParty.get(url)

    weather = response['data']['weather']
    temperature_bottom = weather.first['bottom']
    self.button_max_temp = temperature_bottom.first['maxtempC']
    self.button_min_temp = temperature_bottom.first['mintempC']
    self.button_max_temp_fahrenheit = temperature_bottom.first['maxtempF']
    self.button_min_temp_fahrenheit = temperature_bottom.first['mintempF']

    temperature_top = weather.first['top']
    self.top_max_temp = temperature_top.first['maxtempC']
    self.top_min_temp = temperature_top.first['mintempC']
    self.top_max_temp_fahrenheit = temperature_top.first['mintempF']
    self.top_min_temp_fahrenheit = temperature_top.first['mintempF']

    self.chance_of_snow = weather.first['chanceofsnow']
    self.total_snow_fall = weather.first['totalSnowfall_cm']
  end

  def request_weather_forecast
    url = "http://api.wunderground.com/api/f1189a1f5ed6a722/forecast10day/lang:en/q/#{latitude},#{longitude}.json"
    response = HTTParty.get(url)

    response = Hashie::Mash.new(response)
    forecast_days = response.forecast.txt_forecast.forecastday

    human_numbers = %w(zero one two three four five six)

    # For the next 7 days slice the day and night forecast and assing it to the index in human numbers 

    forecast_days[0..13].each_slice(2).each_with_index do  |(day, night), index|
      self.send("day_#{human_numbers[index]}_day_title=", day.title)
      self.send("day_#{human_numbers[index]}_day_text=", day.fcttext_metric)
      self.send("icon_day_#{human_numbers[index]}=", day.icon_url)
      self.send("day_#{human_numbers[index]}_night_title=", night.title)
      self.send("day_#{human_numbers[index]}_night_text=", night.fcttext_metric)
      self.send("icon_night_#{human_numbers[index]}=", night.icon_url)
    end
  end

  def updated_within_24_hours?
    self.updated_at > Time.now - 1.day
  end

end
