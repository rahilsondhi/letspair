class ChangeSessionWaitingForToWaitingForId < ActiveRecord::Migration
  def up
    rename_column :sessions, :waiting_for, :waiting_for_id
  end

  def down
    rename_column :sessions, :waiting_for_id, :waiting_for
  end
end
