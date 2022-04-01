class Shop < ApplicationRecord
  has_many :deposits
  has_many :shop_administrator
  has_many :deposit_usages
  has_many :shop_deposit_patterns
end
