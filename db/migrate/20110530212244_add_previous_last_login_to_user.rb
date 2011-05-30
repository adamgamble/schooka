class AddPreviousLastLoginToUser < ActiveRecord::Migration
  def change
    add_column :users, :previous_last_login, :datetime
  end
end
