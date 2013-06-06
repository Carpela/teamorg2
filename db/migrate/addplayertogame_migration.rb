class CreatePlayerGameJoinTable < ActiveRecord::Migration
  def change
    create_table :players_games, :id => false do |t|
      t.integer :player_id
      t.integer :game_id
    end
  end
end