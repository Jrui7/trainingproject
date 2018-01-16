class AddColumnAdminReviewToSeeds < ActiveRecord::Migration[5.0]
  def change
    add_column :seeds, :admin_review, :string, default: "not-reviewed"
  end
end
