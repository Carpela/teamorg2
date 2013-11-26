class ChangeDefaultStatusToInvited < ActiveRecord::Migration
  def up
    change_column :game_players, :status, :string, :default => "invited"
  end
  def down
    change_column :game_players, :status, :string, :default => "players"
  end
end 
