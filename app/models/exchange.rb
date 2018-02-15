class Exchange < ApplicationRecord
  belongs_to :pick
  belongs_to :user

  scope :not_answered, -> { where(admin_review: false) }

  def message_author
    self.user == self.pick.user ? "picker" : "admin"
  end



end
