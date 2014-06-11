class AddElementsToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :lift_count, :integer
    add_column :resorts, :run_count, :integer
  end
end
