class AddFieldsToResort < ActiveRecord::Migration
  def change
    change_table :resorts do |t|
      t.float :latitude
      t.float :longitude
      t.integer :area_id
    end
  end
end
