class Shop::DepositPatternsController < ShopApplicationController
  def index
    @shop_deposit_patterns = current_shop.shop_deposit_patterns
  end

  def create
    shop_deposit_pattern_params = params.require(:shop_deposit_pattern).permit(:name, :description, :amount, :bonus_amount)
    current_shop.shop_deposit_patterns.create(shop_deposit_pattern_params)

    redirect_to action: "index"
  end

  def edit
    @shop_deposit_pattern = current_shop.shop_deposit_patterns.find(params[:id])
  end

  def update
    shop_deposit_pattern = current_shop.shop_deposit_patterns.find(params[:id])
    shop_deposit_pattern_params = params.require(:shop_deposit_pattern).permit(:name, :description, :amount, :bonus_amount)
    shop_deposit_pattern.update(shop_deposit_pattern_params)

    redirect_to action: "index"
  end

  def destroy
    @shop_deposit_pattern = current_shop.shop_deposit_patterns.find(params[:id])
    @shop_deposit_pattern.destroy

    redirect_to action: "index"
  end
end
