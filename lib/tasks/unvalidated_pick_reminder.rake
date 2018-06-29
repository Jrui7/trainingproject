namespace :pick do
  desc "send reminder to unvalidated picks"
  task unvalidated_pick_reminder: :environment do
    SendPickReminderJob.perform_later
  end
end
