class GamePlayers < ActiveRecord::Base
  attr_accessible :player_attributes, :game_attributes, :player_id, :game_id

  belongs_to :player
  belongs_to :game

  accepts_nested_attributes_for :player
  accepts_nested_attributes_for :game
end
