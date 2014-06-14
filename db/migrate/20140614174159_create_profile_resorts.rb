class CreateProfileResorts < ActiveRecord::Migration
  def change
    create_table :profile_resorts do |t|
      t.references :profile
      t.references :resort

      t.timestamps
    end
    add_index :profile_resorts, :profile_id
    add_index :profile_resorts, :resort_id
  end
end
