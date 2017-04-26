class AddUserRefToLeads < ActiveRecord::Migration[5.1]
  def change
    add_reference :leads, :user, foreign_key: true
  end
end
