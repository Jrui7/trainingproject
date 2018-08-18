class CampaignMailer < ApplicationMailer

  def payment_error(user_id, campaign_id, pick_id)
    @user = User.find(user_id)
    @pick = Pick.find(pick_id)
    @campaign = Campaign.find(campaign_id)
    mail to: @user.email, subject: "Erreur de paiement", from: '"Pickalgo" <contact@pickalgo.com>'
  end

  def pick_success(user_id, campaign_id, pick_id)
    @user = User.find(user_id)
    @campaign = Campaign.find(campaign_id)
    @pick = Pick.find(pick_id)
    mail to: @user.email, subject: "Campagne d'achat concluante", from: '"Pickalgo" <contact@pickalgo.com>'
  end


end
