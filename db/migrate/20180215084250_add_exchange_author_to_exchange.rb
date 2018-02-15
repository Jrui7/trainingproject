class AddExchangeAuthorToExchange < ActiveRecord::Migration[5.0]
  def change
    add_reference :exchanges, :user, index: true
  end
end
