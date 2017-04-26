# In charge of Admin/Agent/Customer Users
class User < ApplicationRecord
  enum role: %i[customer agent admin]

  devise :database_authenticatable, :registerable, :encryptable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :email, uniqueness: true
  validates :name, presence: true
  validates :encrypted_password, presence: true
end
