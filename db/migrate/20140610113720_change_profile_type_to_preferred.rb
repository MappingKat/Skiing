class ChangeProfileTypeToPreferred < ActiveRecord::Migration
  def up
    rename_column :profiles, :type, :prefered
  end

  def down
    # empty because type is a reserved word and we don't want to name it back
  end
end
