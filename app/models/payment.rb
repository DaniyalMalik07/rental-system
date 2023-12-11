class Payment < ApplicationRecord
  belongs_to :lease

  validates :month, presence: true, inclusion: { in: 1..12 }
  validates :year, presence: true
end
