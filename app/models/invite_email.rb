class InviteEmail
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :text, :include_game_info, :include_signup_links, :groups, :game
  validates :text, presence: true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end

  def populate_text(with_game_info = true)
    text = "Hi, Who's in for football?\n"
    if with_game_info
      text += "Location: #{game.location}\n"
      text += "Date: #{@game.time.strftime("%H:%M") +' '+ @game.date.to_s}\n"
    end
    text
  end

  def save
    groups.each do |group|
      next if group.blank?
      game.game_players.send(group.downcase.to_sym).each do |gameplayer|
        PlayersMailer.generic_email(gameplayer, text, include_game_info, include_signup_links).deliver
      end
    end
  end
end