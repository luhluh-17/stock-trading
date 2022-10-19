require 'rails_helper'

RSpec.describe Product, type: :model do
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
  end

  context 'Validation Test' do
    it 'Save Product' do
      @prod.valid?
      expect(@prod.valid?).to eq(true)
    end
  end

  context 'Invalidation Test' do
    it 'User must exist' do
      @prod.user_id = nil
      @prod.valid?
      expect(@prod.errors.messages[:user]).not_to be_empty
    end
    it "Symbol can't be blank" do
      @prod.symbol = nil
      @prod.valid?
      expect(@prod.errors.messages[:symbol]).not_to be_empty
    end
    it 'Amount must be greater than 0' do
      @prod.amount = -1000
      @prod.valid?
      expect([@prod.errors[:amount]]).not_to be_empty
    end
    it 'Percentage must be greater than 0' do
      @prod.percentage = -10
      @prod.valid?
      expect([@prod.errors[:percetage]]).not_to be_empty
    end
    it 'Percentage must be less than 30' do
      @prod.percentage = 50
      @prod.valid?
      expect([@prod.errors[:percetage]]).not_to be_empty
    end
  end
end
