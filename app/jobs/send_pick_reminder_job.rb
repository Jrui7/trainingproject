class SendPickReminderJob < ApplicationJob
  queue_as :other

  def perform(seed_id)
    seed = Seed.find(seed_id)
    seed.picks.each do |pick|
      PickreminderMailer.send_reminder_email(pick.id, pick.user_id).deliver_later
      pick.reminder = true
      pick.save
    end
  end
end
