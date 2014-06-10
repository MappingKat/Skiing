class RenameOffPisteToSpecialities < ActiveRecord::Migration
  def up
    rename_column :profiles, :off_piste, :specialities
  end

  def down
  end
end
