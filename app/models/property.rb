class Property < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :rental_transactions
  has_many_attached :images

  validates :address, :advance_amount, :rent_amount, presence: true
  validates :rent_amount, :advance_amount, numericality: true

  enum status: { available_for_rent: 0, rented: 1, on_hold: 2 }
end
