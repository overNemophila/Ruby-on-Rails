class DepositUsage < ApplicationRecord
  belongs_to :user
  belongs_to :deposit
  belongs_to :shop
  belongs_to :shop_administrator
end
