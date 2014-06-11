class AddFlagToResort < ActiveRecord::Migration
  def change
    add_column :resorts, :requested, :boolean, default: false
    Resort.all.each do |resort| 
      resort.requested = false
      resort.save
    end
  end
end
