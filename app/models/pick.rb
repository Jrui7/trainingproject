class Pick < ApplicationRecord
  belongs_to :seed
  belongs_to :user

  validates :price,
    presence: {
    message: "Pick non validé"
    }

end
