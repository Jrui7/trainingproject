namespace :pick do
  desc "send reminder to unvalidated picks"
  task unvalidated_pick_reminder: :environment do
    SendPickReminderJob.peform_later
  end
end
