class AddRegionFlagToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :region_requested, :boolean, default: false
    Resort.all.each do |resort| 
      resort.region_requested = false
      resort.save
    end
  end
end
