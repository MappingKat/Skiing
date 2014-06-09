class ChangeUserIdToInteger < ActiveRecord::Migration
  def up
    change_column :profiles, :user_id, 'integer USING CAST(user_id AS integer)'
  end

  def down
    change_column :profiles, :user_id, 'string USING CAST(user_id AS string)'
  end
end
