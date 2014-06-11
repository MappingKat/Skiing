class AddNightWeatherForecastToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :day_zero_night_title, :string
    add_column :resorts, :day_zero_night_text, :string
    add_column :resorts, :day_one_night_title, :string
    add_column :resorts, :day_one_night_text, :string
    add_column :resorts, :day_two_night_title, :string
    add_column :resorts, :day_two_night_text, :string
    add_column :resorts, :day_three_night_title, :string
    add_column :resorts, :day_three_night_text, :string
    add_column :resorts, :day_four_night_title, :string
    add_column :resorts, :day_four_night_text, :string
    add_column :resorts, :day_five_night_title, :string
    add_column :resorts, :day_five_night_text, :string
    add_column :resorts, :day_six_night_title, :string
    add_column :resorts, :day_six_night_text, :string
  end
end
