class Deposit < ApplicationRecord
  belongs_to :user
  belongs_to :shop
  belongs_to :shop_administrator
  has_many :deposit_usages

  def balance
    total_amount - used_amount
  end

  def total_amount
    amount + bonus_amount
  end

  def used_amount
    deposit_usages.sum(&:amount)
  end
end
