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

  enum timeline_to_sell: %i[
    asap 2_4_weeks 4_6_weeks few_months just_curious
  ]

  enum looking_for_another: %i[
    yes already_found not
  ]

  enum reasons_for_selling: %i[
    upgrading relocating downsizing retiring selling_investment
  ]

  validates :bedrooms, :bathrooms, :address,
            :lat, :lng, :built_surface,
            :user,
            presence: true
  belongs_to :user

  has_and_belongs_to_many :characteristics
end
