class Category < ApplicationRecord
  has_many :seeds
  has_many :user_preferences
end
