# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :resort do
    name "MyString"
    country "MyString"
    region "MyString"
    area "MyString"
    map "MyText"
    image "MyText"
    min_new_snow_24h "MyString"
    max_new_snow_24h "MyString"
    min_average_base_depth 1
    max_average_base_depth 1
    lift_status false
    forecast_date "2014-06-09"
    day_max_temp 1
    night_max_temp 1
    night_weather_description "MyText"
    day_weather_description "MyText"
    avalanche_warning 1
    day_min_temp 1
    night_min_temp 1
    daily_pass_adults 1
    daily_pass_kids 1
    six_days_pass_adults 1
    six_days_pass_kids 1
    resort_type "MyString"
    resort_status "MyString"
    surface_conditions "MyText"
    snow_last_48hours "MyText"
    night_grooming "MyText"
    weather_forecast "MyText"
  end
end
