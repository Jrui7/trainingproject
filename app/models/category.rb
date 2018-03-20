class Category < ApplicationRecord
  has_many :seeds, dependent: :destroy
  extend FriendlyId
  friendly_id :name, use: :slugged
end
