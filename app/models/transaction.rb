class Transaction < ApplicationRecord
  validates_numericality_of :price, greater_than: 0
  validates_numericality_of :amount, greater_than: 0

  belongs_to :user
  belongs_to :product
end
