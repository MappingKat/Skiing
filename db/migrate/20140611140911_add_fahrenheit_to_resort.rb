class AddFahrenheitToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :button_max_temp_fahrenheit, :integer
    add_column :resorts, :button_min_temp_fahrenheit, :integer
    add_column :resorts, :top_max_temp_fahrenheit, :integer
    add_column :resorts, :top_min_temp_fahrenheit, :integer
  end
end
