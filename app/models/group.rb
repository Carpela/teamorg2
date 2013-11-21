class Group < ActiveRecord::Base
  attr_accessible :name, :user_id, :game_id
  attr_accessor :game_id

  after_create :populate_from_game

  belongs_to :user
  has_and_belongs_to_many :players, uniq: true

  validates :name, presence: true

  private

  # If we creating group from game - populate it with game players
  def populate_from_game
    unless game_id.blank?
      game = Game.find_by_id game_id
      self.players << game.try(:players)
    end
  end
end