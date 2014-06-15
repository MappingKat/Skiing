class AddIconNightToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :icon_night_zero, :string
    add_column :resorts, :icon_night_one, :string
    add_column :resorts, :icon_night_two, :string
    add_column :resorts, :icon_night_three, :string
    add_column :resorts, :icon_night_four, :string
    add_column :resorts, :icon_night_five, :string
    add_column :resorts, :icon_night_six, :string
  end
end
