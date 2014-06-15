class AddIconToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :icon_day_zero, :string
    add_column :resorts, :icon_day_one, :string
    add_column :resorts, :icon_day_two, :string
    add_column :resorts, :icon_day_three, :string
    add_column :resorts, :icon_day_four, :string
    add_column :resorts, :icon_day_five, :string
    add_column :resorts, :icon_day_six, :string
  end
end