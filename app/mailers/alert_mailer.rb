class AlertMailer < ActionMailer::Base
  default from: "keiran@carpela.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.alert_mailer.dropout_notification.subject
  #
  def dropout_notification(player)
    @greeting = "#{player.name} has dropped out..."

    mail to: "keiran@carpela.com"
  end
end
