class GamePlayer < ActiveRecord::Base
  attr_accessible :player_attributes, :game_attributes, :player_id, :game_id, :status, :player

  belongs_to :player
  belongs_to :game

  accepts_nested_attributes_for :player
  accepts_nested_attributes_for :game

  scope :invited, -> {where(status: :invited).joins(:player)}
  scope :available, -> {where(status: :available).joins(:player)}
  scope :unavailable, -> {where(status: :unavailable).joins(:player)}
  scope :selected, -> {where(status: :selected).joins(:player)}
end