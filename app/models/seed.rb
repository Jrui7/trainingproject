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

end
