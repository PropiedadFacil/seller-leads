class AddDefaultsToLead < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:leads, :bedrooms, from: nil, to: 0)
    change_column_default(:leads, :bathrooms, from: nil, to: 0)
    change_column_default(:leads, :built_surface, from: nil, to: '0 sqft')
  end
end
