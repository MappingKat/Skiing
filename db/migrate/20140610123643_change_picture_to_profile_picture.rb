class ChangePictureToProfilePicture < ActiveRecord::Migration
  def up
    rename_column :profiles, :picture, :profile_picture
  end

  def down
  end
end
