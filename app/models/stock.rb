class Stock < ApplicationRecord
  validates_presence_of :symbol
  validates_numericality_of :amount, greater_than: 0

  belongs_to :user
end
