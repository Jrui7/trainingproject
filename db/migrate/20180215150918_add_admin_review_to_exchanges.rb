class AddAdminReviewToExchanges < ActiveRecord::Migration[5.0]
  def change
    add_column :exchanges, :admin_review, :boolean, default: false
  end
end
