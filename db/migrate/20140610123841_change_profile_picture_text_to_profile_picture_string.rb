class ChangeProfilePictureTextToProfilePictureString < ActiveRecord::Migration
  def up
    change_column :profiles, :profile_picture, :string
  end

  def down
    change_column :profiles, :profile_picture, 'text USING CAST(profile_picture AS text)'
  end
end
