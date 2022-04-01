class ShopApplicationController < ApplicationController
  before_action :authenticate_shop_administrator!, :current_shop
  rescue_from ShopError, with: :handle_exception
  rescue_from ActiveRecord::ActiveRecordError, with: :handle_exception

  layout "shop_application"

  def handle_exception(e)
    flash[:alert] = e.message
    redirect_back fallback_location: root_path
  end

  private

  def current_shop
    @current_shop ||= current_shop_administrator&.shop
  end
end
