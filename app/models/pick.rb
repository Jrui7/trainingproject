class Pick < ApplicationRecord
  belongs_to :seed
  belongs_to :user

  validates :price,
    presence: {
    message: "Pick non validé"
    }

  validates :seed_id, uniqueness: { scope: :user_id }
  scope :newest, -> { order(created_at: :desc)}


end
