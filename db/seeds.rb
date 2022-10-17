# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create first user in console to populate marketplace

# admin = User.create(
#   email: 'dlrcstock@gmail.com',
#   password: 'password',
#   password_confirmation: 'password',
#   role: 1,
#   balance: 100_000,
#   first_name: 'dlrc',
#   last_name: 'admin',
#   status: 'verified'
# )

Product.create(symbol: 'SGML', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'STNG', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'TRMD', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'ASC', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'INSW', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'TNK', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'PBF', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'MTR', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'AMR', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'AMD', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'AAPL', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'NVDA', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'AMZN', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'CCL', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'ZYME', amount: 1000, percentage: 30, user_id: User.first.id)
Product.create(symbol: 'WFC', amount: 1000, percentage: 30, user_id: User.first.id)

# Admin Portfolio
Stock.create(symbol: 'SGML', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'MTR', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'AAPL', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'STNG', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'ASC', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'TRMD', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'INSW', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'TNK', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'PBF', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'AMR', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'AMD', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'NVDA', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'AMZN', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'CCL', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'ZYME', amount: 1000, user_id: User.first.id)
Stock.create(symbol: 'WFC', amount: 1000, user_id: User.first.id)

# Create second user to popolate P2P Transaction
Transaction.create(user_id: User.second.id, product_id: Product.first.id, price: 397.84, amount: 13.5)
Transaction.create(user_id: User.second.id, product_id: Product.second.id, price: 147.60, amount: 8.2)
Transaction.create(user_id: User.second.id, product_id: Product.third.id, price: 428.97, amount: 3.1)

# Second user portfolio
Stock.create(symbol: 'SGML', amount: 1000, user_id: User.second.id)
Stock.create(symbol: 'MTR', amount: 1000, user_id: User.second.id)
Stock.create(symbol: 'AAPL', amount: 1000, user_id: User.second.id)
