class Pick < ApplicationRecord
  require 'csv'
  belongs_to :seed
  belongs_to :user
  has_many :exchanges
  monetize :amount_cents

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
      Pick.select("picks.*, seeds.title as seed_title, users.sex as user_sex, users.date_of_birth as user_birthdate, users.email as user_email").joins(:seed, :user)
  end

  def self.as_csv
    CSV.generate do |csv|
      columns = %w(seed_title id price state full_name street address_complement zip_code city phone_number user_birthdate user_sex user_email)
      csv << columns.map(&:humanize)
      all_with_seed_details.each do |pick|
        csv << pick.attributes.values_at(*columns)
      end
    end
  end










end
