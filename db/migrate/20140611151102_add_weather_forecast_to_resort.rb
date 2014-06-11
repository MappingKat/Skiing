class AddWeatherForecastToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :day_zero_day_title, :string
    add_column :resorts, :day_zero_day_text, :string
    add_column :resorts, :day_one_day_title, :string
    add_column :resorts, :day_one_day_text, :string
    add_column :resorts, :day_two_day_title, :string
    add_column :resorts, :day_two_day_text, :string
    add_column :resorts, :day_three_day_title, :string
    add_column :resorts, :day_three_day_text, :string
    add_column :resorts, :day_four_day_title, :string
    add_column :resorts, :day_four_day_text, :string
    add_column :resorts, :day_five_day_title, :string
    add_column :resorts, :day_five_day_text, :string
    add_column :resorts, :day_six_day_title, :string
    add_column :resorts, :day_six_day_text, :string
    add_column :resorts, :day_seven_day_title, :string
    add_column :resorts, :day_seven_day_text, :string
  end
end
