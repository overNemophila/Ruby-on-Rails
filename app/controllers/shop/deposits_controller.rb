class Shop::DepositsController < ShopApplicationController
  def index
    @start_at = (Time.zone.parse(params[:start_at].to_s) || Time.zone.now).beginning_of_day
    @end_at = (Time.zone.parse(params[:end_at].to_s) || Time.zone.now).end_of_day
    @deposits = Deposit.where(shop: current_shop, deposited_at: @start_at..@end_at).page(params[:page]).per(10)
  end
end
