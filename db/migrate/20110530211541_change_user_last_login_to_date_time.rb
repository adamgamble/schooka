class ChangeUserLastLoginToDateTime < ActiveRecord::Migration
  def up
    remove_column :users, :last_login
    add_column :users, :last_login, :datetime
  end

  def down
  end
end
