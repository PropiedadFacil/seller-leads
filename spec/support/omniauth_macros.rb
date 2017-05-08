# The mock_auth configuration allows you to set per-provider (or default)
# authentication hashes to return during integration testing.
module OmniauthMacros
  def mock_auth_hash
    OmniAuth.config.mock_auth[:facebook] =
      OmniAuth::AuthHash.new(
        'provider' => 'facebook',
        'uid' => '123545',
        'info' => {
          'first_name' => Faker::Name.first_name,
          'last_name' => Faker::Name.last_name,
          'image' => 'mock_user_thumbnail_url',
          'email' => Faker::Internet.email
        },
        'credentials' => {
          'token' => 'mock_token',
          'secret' => 'mock_secret'
        }
      )
  end

  def set_oauth
    OmniAuth.config.test_mode = true
    mock_auth_hash
    Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
    Rails.application.env_config['omniauth.auth'] = OmniAuth.config.mock_auth[:facebook]
    Rails.application.env_config['omniauth.origin'] = 'http://localhost:3000/wizard/step4'
  end
end
