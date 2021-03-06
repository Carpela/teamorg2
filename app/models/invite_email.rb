class InviteEmail
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :text, :include_game_info, :include_signup_links, :groups, :game, :subject
  validates :text, presence: true

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def persisted?
    false
  end
  def populate_subject
    subject = "Game #{@game.date.strftime("%a %d/%m/%Y") +' '+ @game.time.strftime("%H:%M%p")} #{@game.location}"
  end
  def populate_text(with_game_info = true)
    text = "Are you up for the game on #{@game.date.strftime("%A")}?"
    if with_game_info
      text += "Location: #{game.location}\n"
      text += "Date: #{@game.date.strftime("%A %d/%m/%Y")}\n"
      text += "Time: #{@game.time.strftime("%H:%M%p")}\n"
      
    end
    text
  end

  def save
    groups.each do |group|
      next if group.blank?
      game.game_players.send(group.downcase.to_sym).each do |gameplayer|
        PlayersMailer.generic_email(gameplayer, text, include_game_info, include_signup_links, subject).deliver
      end
    end
  end
end