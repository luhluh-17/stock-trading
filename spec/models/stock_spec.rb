require 'rails_helper'

RSpec.describe Stock, type: :model do
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

    @stock = Stock.new(symbol: 'AMD', amount: 23.4, user_id: @user.id)
  end

  context 'Validation Test' do
    it 'Save Stock' do
      @stock.valid?
      expect(@stock.valid?).to eq(true)
    end
  end

  context 'Invalidation Test' do
    it 'User must exist' do
      @stock.user_id = nil
      @stock.valid?
      expect(@stock.errors.messages[:user]).not_to be_empty
    end
    it "Symbol can't be blank" do
      @stock.symbol = nil
      @stock.valid?
      expect(@stock.errors.messages[:symbol]).not_to be_empty
    end
    it 'Amount must be numerical' do
      @stock.amount = 'Amount'
      @stock.valid?
      expect([@stock.errors[:amount]]).not_to be_empty
    end
    it 'Amount must be greater than 0' do
      @stock.amount = -123
      @stock.valid?
      expect([@stock.errors[:amount]]).not_to be_empty
    end
  end
end
