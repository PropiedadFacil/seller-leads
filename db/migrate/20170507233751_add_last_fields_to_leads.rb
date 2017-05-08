class AddLastFieldsToLeads < ActiveRecord::Migration[5.1]
  def change
    add_column :leads, :timeline_to_sell, :integer
    add_column :leads, :looking_for_another, :integer
    add_column :leads, :reasons_for_selling, :integer
    add_column :leads, :own_valuation, :string, default: ''
    add_column :leads, :anything_else, :text, default: ''
  end
end
