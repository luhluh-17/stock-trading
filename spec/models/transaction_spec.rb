require 'rails_helper'

RSpec.describe Transaction, type: :model do
  before(:each) do
    @user = User.new(
      email: 'johndoe@test.com',
      password: 'password',
      password_confirmation: 'password',
      balance: 100_000,
      first_name: 'John',
      last_name: 'Doe',
      unconfirmed_email: nil,
      status: 'verified'
    )

    @user.skip_confirmation!
    @user.save!

    @prod = Product.new(symbol: 'AMD', amount: 23.4, percentage: 10, user_id: @user.id)
    @prod.save

    @trx = Transaction.new(user_id: @user.id, product_id: @prod.id, price: 1000, amount: 23.1)
  end

  context 'Validation Test' do
    it 'Save Transaction' do
      @trx.valid?
      expect(@trx.valid?).to eq(true)
    end
  end

  context 'Invalidation Test' do
    it 'User must exist' do
      @trx.user_id = nil
      @trx.valid?
      expect(@trx.errors.messages[:user]).not_to be_empty
    end
    it 'Product must exist' do
      @trx.product_id = nil
      @trx.valid?
      expect(@trx.errors.messages[:product]).not_to be_empty
    end
    it 'Percentage must be greater than 0' do
      @trx.price = -1000
      @trx.valid?
      expect([@prod.errors[:price]]).not_to be_empty
    end
    it 'Amount must be greater than 0' do
      @trx.amount = -10
      @trx.valid?
      expect([@trx.errors[:amount]]).not_to be_empty
    end
  end
end
