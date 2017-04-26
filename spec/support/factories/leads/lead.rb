FactoryGirl.define do
  factory :lead do
    user
    lat Faker::Address.latitude
    lng Faker::Address.longitude
    address Faker::Address.street_address
    pool_type Lead.pool_types.keys.sample
    kitchen_condition Lead.kitchen_conditions.keys.sample
    bathroom_condition Lead.bathroom_conditions.keys.sample
    renovated true
    renovated_spent_cents Faker::Number.number(10)
    renovated_description Faker::Lorem.sentence(Faker::Number.digit.to_i)
    bedrooms Faker::Number.digit.to_i
    bathrooms Faker::Number.digit.to_i
    built_surface Faker::Number.number(3)
  end
end
