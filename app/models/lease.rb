class Lease < ApplicationRecord
  belongs_to :property
  belongs_to :tenant, class_name: 'User', foreign_key: 'tenant_id'
  has_many :payments
  after_commit :update_property_status, on: %i[create update]

  def update_property_status
    Property.find_by(id: property_id).update(status: 1)
  end
end
