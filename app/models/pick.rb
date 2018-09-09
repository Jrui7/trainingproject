class Pick < ApplicationRecord
  require 'csv'
  belongs_to :seed
  belongs_to :user
  has_many :exchanges, dependent: :destroy
  monetize :amount_cents
  self.per_page = 10

  validates :price,
    presence: {
    message: "Pick non validé"
    }
  validates :price,
  numericality: {
    greater_than_or_equal_to: 1
     }

  validates :seed_id, uniqueness: { scope: :user_id }
  scope :newest, -> { order(created_at: :desc)}

  def self.all_with_seed_details
      Pick.select("picks.*, seeds.title as seed_title, seeds.expedition_costs as expedition_costs, users.email as user_email").joins(:seed, :user)
  end

  def self.as_csv
    CSV.generate do |csv|
      columns = %w(seed_title id price expedition_costs state first_name last_name street address_complement zip_code city phone_number user_email)
      csv << columns.map(&:humanize)
      all_with_seed_details.each do |pick|
        csv << pick.attributes.values_at(*columns)
      end
    end
  end

  def mark_exchanges_as_answered
     self.exchanges.not_answered.each do |exchange|
        exchange.admin_review = true
        exchange.save
     end
  end

  def self.my_pick(user, seed)
    where(user_id: user.id, seed_id: seed.id)
  end

  def self.pending_picks(user)
    where(user_id: user, state: "pending")
  end



end
