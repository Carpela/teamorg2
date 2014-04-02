class Game < ActiveRecord::Base
  attr_accessor :player_list
  attr_accessible :date, :location, :time, :format, :sides, :players_attributes

  belongs_to :user
  has_many :players, through: :game_players
  has_many :game_players
  validates_presence_of :date, :time, :location
  accepts_nested_attributes_for :players
end
