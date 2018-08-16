class PublishSeedMailer < ApplicationMailer

  def seed_validated(seed_id, user_id)
    @user = User.find(user_id)
    @seed = Seed.friendly.find(seed_id)
    mail to: @user.email, subject: "Post validé", from: '"Max de Pickalgo" <contact@pickalgo.com>'
  end

  def seed_rejected(seed_id, user_id)
    @user = User.find(user_id)
    @seed = Seed.friendly.find(seed_id)
    mail to: @user.email, subject: "Post rejeté", from: '"Lana de Pickalgo" <contact@pickalgo.com>'
  end
end
