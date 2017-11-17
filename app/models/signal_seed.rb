class SignalSeed < ApplicationRecord
  belongs_to :user
  belongs_to :seed

  validates :user, uniqueness: { scope: :seed }

end
