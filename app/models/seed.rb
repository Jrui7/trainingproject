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

  scope :category, -> (category) { where(category_id: category) }

  def self.category(category)
    category
  end
end
