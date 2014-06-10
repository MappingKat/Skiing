class ChangeOffPisteToText < ActiveRecord::Migration
  def up
    change_column :profiles, :off_piste, :text
  end

  def down
    change_column :profiles, :off_piste, 'boolean USING CAST(profile_picture AS boolean)'
  end
end
