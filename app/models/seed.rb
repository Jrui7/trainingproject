class Seed < ApplicationRecord


  belongs_to :category
  belongs_to :user
  has_many :picks

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

  has_attachments :photos, maximum: 5


  def set_expiration
    self.expiration = DateTime.now + 3.days
  end

  def remaining
      expired? ? 0 : (self.expiration - DateTime.now)
  end

  def expired?
    (self.expiration - DateTime.now).to_i <= 0
  end

  def ongoing?
    !expired?
  end



  def last_day?
    secs = (self.expiration - DateTime.now).to_i
    mins = (secs / 60).to_i
    hours = (mins / 60).to_i
    days = (hours / 24).to_i
    days < 1
  end

  scope :popular, -> { order(popularity: :asc) }
  scope :newest, -> { order(expiration: :desc)}





end
