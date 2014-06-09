class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :type
      t.string :level
      t.string :favorite_resorts
      t.boolean :off_piste
      t.string :state
      t.text :picture
      t.text :bio

      t.timestamps
    end
  end
end
