class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
      t.float :lat,   null: false
      t.float :lng,   null: false
      t.string :address, null: false
      t.integer :bedrooms, null: false, default: 0
      t.integer :bathrooms, null: false, default: 0
      t.string :built_surface, null: false, default: '0 sqft'
      t.integer :pool_type
      t.integer :kitchen_condition
      t.integer :bathroom_condition
      t.boolean :renovated,             default: false
      t.integer :renovated_spent_cents, default: 0
      t.text :renovated_description,    default: ''

      t.timestamps
    end
  end
end
