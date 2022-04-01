# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(name: "user1", email: "azqvictor+user1@gmail.com", password: "12345678", confirmed_at: Time.now)
u2 = User.create!(name: "user2", email: "azqvictor+user2@gmail.com", password: "12345678", confirmed_at: Time.now)
u3 = User.create!(name: "user3", email: "azqvictor+user3@gmail.com", password: "12345678", confirmed_at: Time.now)

s1 = Shop.create!(name: "ショップ１号店", image_url: "https://via.placeholder.com/400")
s2 = Shop.create!(name: "ショップ２号店", image_url: "https://via.placeholder.com/400")

sa1 = ShopAdministrator.create!(shop: s1, email: "azqvictor+shop1@gmail.com", password: "87654321")
sa2 = ShopAdministrator.create!(shop: s2, email: "azqvictor+shop2@gmail.com", password: "87654321")

d1 = Deposit.create!(user: u1, shop: s1, amount: 10000, bonus_amount: 2000, deposited_at: Time.now, shop_administrator: sa1)
d2 = Deposit.create!(user: u1, shop: s1, amount: 10000, bonus_amount: 2000, deposited_at: Time.now, shop_administrator: sa1)
d3 = Deposit.create!(user: u1, shop: s2, amount: 10000, bonus_amount: 2000, deposited_at: Time.now, shop_administrator: sa2)
d4 = Deposit.create!(user: u2, shop: s1, amount: 10000, bonus_amount: 2000, deposited_at: Time.now, shop_administrator: sa1)
d5 = Deposit.create!(user: u3, shop: s1, amount: 10000, bonus_amount: 2000, deposited_at: Time.now, shop_administrator: sa1)
d6 = Deposit.create!(user: u1, shop: s1, amount: 10000, bonus_amount: 2000, deposited_at: Time.now, shop_administrator: sa1)
d7 = Deposit.create!(user: u1, shop: s1, amount: 10000, bonus_amount: 2000, deposited_at: Time.now, shop_administrator: sa1)
d8 = Deposit.create!(user: u1, shop: s1, amount: 10000, bonus_amount: 2000, deposited_at: Time.now, shop_administrator: sa2)
d9 = Deposit.create!(user: u2, shop: s1, amount: 10000, bonus_amount: 2000, deposited_at: Time.now, shop_administrator: sa1)
d10 = Deposit.create!(user: u3, shop: s1, amount: 10000, bonus_amount: 2000, deposited_at: Time.now, shop_administrator: sa1)
d11 = Deposit.create!(user: u2, shop: s1, amount: 10000, bonus_amount: 2000, deposited_at: Time.now, shop_administrator: sa1)
d12 = Deposit.create!(user: u3, shop: s1, amount: 10000, bonus_amount: 2000, deposited_at: Time.now, shop_administrator: sa1)

DepositUsage.create!(user: u1, shop: s1, deposit: d1, amount: 1500, used_at: Time.now, shop_administrator: sa1)
DepositUsage.create!(user: u1, shop: s1, deposit: d1, amount: 2000, used_at: Time.now, shop_administrator: sa1)
DepositUsage.create!(user: u1, shop: s1, deposit: d1, amount: 3500, used_at: Time.now, shop_administrator: sa1)
DepositUsage.create!(user: u1, shop: s1, deposit: d1, amount: 4500, used_at: Time.now, shop_administrator: sa1)
DepositUsage.create!(user: u1, shop: s2, deposit: d3, amount: 5000, used_at: Time.now, shop_administrator: sa2)

ShopDepositPattern.create!(shop: s1, amount: 10000, bonus_amount: 1500, name: "新規限定", description: "1500円相当ボーナス")
ShopDepositPattern.create!(shop: s1, amount: 20000, bonus_amount: 2100, name: "2万円チャージ", description: "2100ボーナス付与")
ShopDepositPattern.create!(shop: s1, amount: 30000, bonus_amount: 3500, name: "3万円チャージ", description: "3500ボーナス付与")
