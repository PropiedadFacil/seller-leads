class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
      t.float :lat,   null: false
      t.float :lng,   null: false
      t.string :address, null: false
      t.integer :bedrooms, null: false
      t.integer :bathrooms, null: false
      t.integer :built_surface, null: false
      t.integer :pool_type,             default: 0
      t.integer :kitchen_condition,     default: 0
      t.integer :bathroom_condition,    default: 0
      t.boolean :renovated,             default: false
      t.integer :renovated_spent_cents, default: 0
      t.text :renovated_description,    default: ''

      t.timestamps
    end
  end
end
