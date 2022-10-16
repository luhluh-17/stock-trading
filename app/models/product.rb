class Product < ApplicationRecord
  validates_presence_of :symbol
  validates_numericality_of :amount, greater_than: 0
  validates_numericality_of :percentage, in: 0...30

  belongs_to :user

  has_many :transactions
  has_many :users, through: :transactions
end
