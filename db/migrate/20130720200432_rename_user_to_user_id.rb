class RenameUserToUserId < ActiveRecord::Migration
  def up
    rename_column :events, :user, :user_id
  end

  def down
    rename_column :events, :user_id, :user
  end
end
