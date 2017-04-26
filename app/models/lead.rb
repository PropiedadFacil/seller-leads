# This model represents an User's (customer) submission through the form
class Lead < ApplicationRecord
  enum pool_type: %i[
    in_ground above_ground none_or_community
  ]

  enum kitchen_condition: %i[
    great_kitchen typical_kitchen needs_work_kitchen
  ]
  enum bathroom_condition: %i[
    great_bathroom typical_bathroom needs_work_bathroom
  ]

  validates :bedrooms, :bathrooms, :address,
            :lat, :lng, :built_surface,
            presence: true
end
