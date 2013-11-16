class AddStatusToGamePlayers < ActiveRecord::Migration
  def change
    add_column :game_players, :status, :string, default: :players
    add_index :game_players, :status
  end
end
