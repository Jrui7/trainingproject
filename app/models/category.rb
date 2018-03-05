class Category < ApplicationRecord
  has_many :seeds, dependent: :destroy
end
