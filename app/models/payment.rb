class Payment < ApplicationRecord
  belongs_to :lease

  validates :month, presence: true, inclusion: { in: 1..12 }
  validates :year, presence: true
  enum payment_method: { cash: 0, card: 1, cheque: 2 }
end
