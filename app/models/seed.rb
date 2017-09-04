class Seed < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :picks

  validates :title,
    presence: true,
    length: { minimum: 5 }

  validates :description,
    presence: true,
    length: { minimum: 5 }

  has_attachments :photos, maximum: 5
end
