class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :outings_users
  has_many :outings, through: :outings_users
end