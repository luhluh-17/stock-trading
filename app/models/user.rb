class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :confirmable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # define default role for new records
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= user
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # statuses
  STATUSES = %i[pending verified rejected]
  has_many :stocks
  has_many :transactions
  has_many :products
end
