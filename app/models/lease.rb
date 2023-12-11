# frozen_string_literal: true

class Lease < ApplicationRecord
  belongs_to :property
  belongs_to :tenant, class_name: 'User', foreign_key: 'tenant_id'
  has_many :payments

  after_commit :update_property_status, on: %i[create update]
  after_commit :update_property_status_for_delete, on: :destroy

  private

  def update_property_status
    change_property_status(1)
  end

  def update_property_status_for_delete
    change_property_status(0)
  end

  def change_property_status(new_status)
    property&.update_column(:status, new_status)
  end
end
