class ChangeAttributesInResort < ActiveRecord::Migration
  def up
    add_column :resorts, :button_max_temp, :integer
    add_column :resorts, :button_min_temp, :integer
    add_column :resorts, :top_max_temp, :integer
    add_column :resorts, :top_min_temp, :integer
    add_column :resorts, :chance_of_snow, :integer
    add_column :resorts, :total_snow_fall, :integer
    remove_column :resorts, :min_new_snow_24h
    remove_column :resorts, :max_new_snow_24h
    remove_column :resorts, :min_average_base_depth
    remove_column :resorts, :max_average_base_depth
  end

  def down
    remove_column :resorts, :button_max_temp, :integer
    remove_column :resorts, :button_min_temp, :integer
    remove_column :resorts, :top_max_temp, :integer
    remove_column :resorts, :top_min_temp, :integer
    remove_column :resorts, :chance_of_snow, :integer
    remove_column :resorts, :total_snow_fall, :integer
    add_column :resorts, :min_new_snow_24h
    add_column :resorts, :max_new_snow_24h
    add_column :resorts, :min_average_base_depth
    add_column :resorts, :max_average_base_depth
  end
end
