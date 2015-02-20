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

  def charge(amount)
    require 'cgi'
    request = GoCardless.new_bill_url(
      :amount => amount, 
      #:merchant_id => ENV['GC_MERCHANT_ID'],
      :name => "Football "+Time.now.strftime("%Y/%m/%d"),
      :user            => {
        :first_name       => self.player.name,
        :email            => self.player.email,
        :country_code     => "GB"
        }
      )
    puts CGI::parse(request)
    return request

  end

end