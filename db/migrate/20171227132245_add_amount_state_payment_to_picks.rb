class AddAmountStatePaymentToPicks < ActiveRecord::Migration[5.0]
  def change
    add_monetize :picks, :amount, currency: { present: false }
    add_column :picks, :state, :string
    add_column :picks, :payment, :jsonb

  end
end
