class Exchange < ApplicationRecord
  belongs_to :pick
  belongs_to :user

  def message_author
    self.user == self.pick.user ? "picker" : "admin"
  end
end
