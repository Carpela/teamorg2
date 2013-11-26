class AddGameAndPlayerToGamePlayer < ActiveRecord::Migration
  def change
    add_column :game_players, :game_id, :integer
    add_column :game_players, :player_id, :integer
  end
end
