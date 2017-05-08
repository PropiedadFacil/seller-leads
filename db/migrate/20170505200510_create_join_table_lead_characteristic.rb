class CreateJoinTableLeadCharacteristic < ActiveRecord::Migration[5.1]
  def change
    create_join_table :leads, :characteristics do |t|
      t.index [:lead_id, :characteristic_id]
      t.index [:characteristic_id, :lead_id]
    end
  end
end
