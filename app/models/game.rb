class Game < ActiveRecord::Base
  attr_accessible :date, :location, :time
  has_and_belongs_to_many :players
  belongs_to :team
  attr_accessor :player_list
  after_save :update_players
end
