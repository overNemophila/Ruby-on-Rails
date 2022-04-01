class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[line google_oauth2]

  has_many :user_authentications
  has_many :deposits
  has_many :deposit_usages

  validates :name, presence: true

  def self.payment_verifier
    Rails.application.message_verifier(:payment)
  end

  def payment_token(purpose: :qr_code)
    self.class.payment_verifier.generate(id, purpose: purpose, expires_in: 5.minutes)
  end

  def payment_token_valid?(token, purpose: :qr_code)
    self.class.payment_verifier.verified(token, purpose: purpose) == id
  end

  def deposites_at(shop)
    @deposites_at ||= {}
    @deposites_at[shop] ||= deposits.where(shop: shop)
  end

  def balance_at(shop)
    deposites_at(shop).sum(&:balance)
  end

  def consume(shop, amount, shop_administrator)
    fail if amount <= 0
    remain = amount
    deposits = deposites_at(shop)
    deposit_usages = []
    deposits.each do |deposit|
      balance = deposit.balance
      if balance > 0
        if balance >= remain
          deposit_usages << deposit.deposit_usages.create(user: self, shop: shop, shop_administrator: shop_administrator, amount: remain, used_at: Time.now)
          remain = 0
          break
        else
          deposit_usages << deposit.deposit_usages.create(user: self, shop: shop, shop_administrator: shop_administrator, amount: balance, used_at: Time.now)
          remain -= balance
        end
      end
    end
    fail NotEnoughBalance, "残高が足りません" if remain > 0
    deposit_usages
  end

  def deposit(shop, pattern, shop_administrator)
    deposits.create(shop: shop, shop_administrator: shop_administrator, amount: pattern.amount, bonus_amount: pattern.bonus_amount, deposited_at: Time.now)
  end
end
