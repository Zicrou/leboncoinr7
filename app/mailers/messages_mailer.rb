class MessagesMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.messages_mailer.submitted.subject
  #
  def submitted(message)
    @message = message

    mail to: "aazseck@gmail.com", subject: "New message!"
  end
end
