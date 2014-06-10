class CreateProfileSpecialities < ActiveRecord::Migration
  def change
    create_table :profile_specialities do |t|
      t.references :profile
      t.references :speciality

      t.timestamps
    end
    add_index :profile_specialities, :profile_id
    add_index :profile_specialities, :speciality_id
  end
end
