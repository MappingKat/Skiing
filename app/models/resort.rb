class Resort < ActiveRecord::Base
  attr_accessible :area, :area_id, :avalanche_warning, :country, :daily_pass_adults, :daily_pass_kids, :day_max_temp, :day_min_temp, :day_weather_description, :forecast_date, :image, :lift_status, :map, :max_average_base_depth, :max_new_snow_24h, :min_average_base_depth, :min_new_snow_24h, :name, :night_grooming, :night_max_temp, :night_min_temp, :night_weather_description, :region, :resort_status, :resort_type, :six_days_pass_adults, :six_days_pass_kids, :snow_last_48hours, :surface_conditions, :weather_forecast

  acts_as_commentable

  has_many :resort_relationships
  has_many :instructors, through: :resort_relationships
 
  validates :area_id, uniqueness: true
  validates :name, uniqueness: true

end
