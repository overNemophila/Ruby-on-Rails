class Shop::HomeController < ShopApplicationController
  def index
    @deposits = Deposit.where(shop: current_shop, deposited_at: Time.zone.now.all_day)
    @deposit_usages = DepositUsage.where(shop: current_shop, used_at: Time.zone.now.all_day)
    @shop_deposit_patterns = current_shop.shop_deposit_patterns
  end
end
