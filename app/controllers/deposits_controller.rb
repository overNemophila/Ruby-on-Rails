class DepositsController < ApplicationController
  before_action :authenticate_user!

  def index
    @deposits = current_user.deposits.includes(:shop, :deposit_usages).group_by(&:shop)
  end

  # QRコード表示
  def new
    @shop = Shop.find_by(id: params[:shop_id].to_i)
  end

  def history
    @shop = Shop.find(params[:shop_id].to_i)
    @deposits = current_user.deposits.includes(:deposit_usages).where(shop: @shop) || []
  end
end
