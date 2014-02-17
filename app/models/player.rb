class Player < ActiveRecord::Base
  attr_accessible :email, :name, :phone
  belongs_to :team
  has_many :games, through: :game_players
  has_many :game_players

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

end

def first_name
  self.name.split[0...1].join(' ')
end