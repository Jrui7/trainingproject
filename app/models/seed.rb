class Seed < ApplicationRecord
  belongs_to :category
  belongs_to :user

  validates :title,
    presence: true,
    length: { minimum: 5 }

  validates :description,
    presence: true,
    length: { minimum: 5 }
end
