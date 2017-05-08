# In charge of Admin/Agent/Customer Users
class User < ApplicationRecord
  enum role: %i[customer agent admin]

  devise :database_authenticatable, :registerable, :encryptable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :first_name, presence: true
  validates :encrypted_password, presence: true

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.role = 'customer'
    end
  end
end
