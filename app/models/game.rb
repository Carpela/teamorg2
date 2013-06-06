class Game < ActiveRecord::Base
  attr_accessible :date, :location, :time
  has_and_belongs_to_many :players
  attr_accessor :player_list
  after_save :update_players
end
