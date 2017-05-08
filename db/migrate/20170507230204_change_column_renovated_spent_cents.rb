class ChangeColumnRenovatedSpentCents < ActiveRecord::Migration[5.1]
  def change
    remove_column :leads, :renovated_spent_cents
    add_column :leads, :renovated_spent, :string, default: ''
  end
end
