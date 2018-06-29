class PickreminderMailer < ApplicationMailer
  def send_reminder_email(pick_id, user_id)
    @user = User.find(user_id)
    @pick = Pick.find(pick_id)
    mail to: @user.email, subject: "Pick en attente", from: 'contact@pickalgo.com'
  end
end
