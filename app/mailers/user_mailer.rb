class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(user)
    @user = user
    mail to: @user.email, subject: "#{@user.pseudo}: en route pour une super expérience"
  end

  def payment_error(user_id)
    @user = User.find(user_id)
    mail to: @user.email, subject: "Erreur de paiement"
  end
end
