class Property < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :rental_transactions

  validates :address, :advance_amount, :rent_amount, presence: true

  enum status: { available_for_rent: 0, rented: 1, on_hold: 2 }
end
