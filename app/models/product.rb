class Product < ApplicationRecord
  belongs_to :user

  has_many :transactions
  has_many :users, through: :transactions
end
