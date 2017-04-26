FactoryGirl.define do
  factory :user do
    name 'Same Name'
    email 'test@user.com'
    password Devise.friendly_token.first(8)
  end
end
