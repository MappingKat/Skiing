class CreateResorts < ActiveRecord::Migration
  def change
    create_table :resorts do |t|
      t.string :name
      t.string :country
      t.string :region
      t.string :area
      t.text :map
      t.text :image
      t.string :min_new_snow_24h
      t.string :max_new_snow_24h
      t.integer :min_average_base_depth
      t.integer :max_average_base_depth
      t.boolean :lift_status
      t.date :forecast_date
      t.integer :day_max_temp
      t.integer :night_max_temp
      t.text :night_weather_description
      t.text :day_weather_description
      t.integer :avalanche_warning
      t.integer :day_min_temp
      t.integer :night_min_temp
      t.integer :daily_pass_adults
      t.integer :daily_pass_kids
      t.integer :six_days_pass_adults
      t.integer :six_days_pass_kids
      t.string :resort_type
      t.string :resort_status
      t.text :surface_conditions
      t.text :snow_last_48hours
      t.text :night_grooming
      t.text :weather_forecast

      t.timestamps
    end
  end
end
