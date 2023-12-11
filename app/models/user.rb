class User < ApplicationRecord
  has_many :owned_properties, class_name: 'Property', foreign_key: 'owner_id'
  has_many :leases, foreign_key: 'tenant_id'

  validates :first_name, :last_name, presence: true
  validates :email, :phone_number, presence: true, uniqueness: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
