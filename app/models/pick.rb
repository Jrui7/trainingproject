class Pick < ApplicationRecord
  require 'csv'
  belongs_to :seed
  belongs_to :user

  validates :price,
    presence: {
    message: "Pick non validé"
    }

  validates :seed_id, uniqueness: { scope: :user_id }
  scope :newest, -> { order(created_at: :desc)}

  def self.all_with_seed_details
      Pick.select("picks.*, seeds.title as seed_title, users.first_name as user_first_name").joins(:seed, :user)
  end

  def self.as_csv
    CSV.generate do |csv|
      columns = %w(id price seed_title user_first_name)
      csv << columns.map(&:humanize)
      all_with_seed_details.each do |pick|
        csv << pick.attributes.values_at(*columns)
      end
    end
  end


end
