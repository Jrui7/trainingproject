class Seed < ApplicationRecord

  has_one :campaign, dependent: :destroy
  belongs_to :category
  belongs_to :user
  has_many :picks, dependent: :destroy
  has_many :signal_seed, dependent: :destroy
  monetize :price_cents


  validates :title,
    presence: {
    message: "Donnez un titre au seed"
    }

  validates :title, length: { minimum: 5 }

  validates :description,
    presence: {
    message: "Description personnelle obligatoire"
    }

  validates :description,  length: { minimum: 5,
    too_short: "%{count} carractères au minimum" }

  validates :category_id, presence: {
    message: "Attribuez une catégorie au seed"
    }

  validates :price, presence: {
    message: "A quel prix est-il actuellement vendu?"
    }

  validates :photos, presence: {
    message: "Ajoutez au moins une photo"
    }

  validates :url, url: true
  validates :secondary_url, url: true



  has_attachments :photos, maximum: 5

  scope :popular, -> { order(popularity: :desc) }
  scope :newest, -> { order(expiration: :desc)}
  scope :ongoing, -> { where('expiration > ?', DateTime.now)}
  scope :expired, -> { where('expiration < ?', DateTime.now)}
  scope :last_day, -> { where('expiration < ?', (DateTime.now + 1.days))}

  def set_expiration
    self.expiration = DateTime.now + 7.days
  end


  def set_view_counter
    self.view_counter = 0
  end

  def increment_views
    self.view_counter += 1
    save!
  end

  def set_popularity
    self.popularity = 0
  end

  def increment_popularity
    self.popularity = (self.view_counter + self.picks.count * 5)
    save!
  end

  def extract_seed_photos
    collection = []
    self.photos.each do |photo|
      collection << photo
    end
    return collection
  end

  def ongoing?
    self.expiration > DateTime.now
  end

  def self.seed_selection
    ongoing.where.not(admin_review:"Invalide").includes(:user, :category)
  end

  def self.seed_sample_expired
    where.not(admin_review:"Invalide")
  end

  def refund_seed
    self.picks.each do |pick|
      if pick.state == "paid"
        payment_hash = JSON.parse(pick.payment)
         Stripe::Refund.create(
           charge: payment_hash["id"]
         )
         pick.state = "refunded"
      else
        pick.state = "cancelled"
      end
      pick.save
    end
  end



end
