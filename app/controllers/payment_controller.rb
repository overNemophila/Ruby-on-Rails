class PaymentController < ShopApplicationController
  def new
    user_id = params[:user_id]
    @user = User.find(user_id)
    render 'token_invalid' unless @user.payment_token_valid?(params[:token])
  end

  def create
    user_id = params[:user_id]
    @user = User.find(user_id)
    return render 'token_invalid' unless @user.payment_token_valid?(params[:payment_token], purpose: :payment)

    case params[:payment_action]
    when "new"
      new_deposit
    when "use"
      use_deposit
    end
  end

  private

  def new_deposit
    shop_deposit_pattern_id = params[:shop_deposit_pattern_id].to_i
    pattern = ShopDepositPattern.find(shop_deposit_pattern_id)
    @user.with_lock do
      @deposit = @user.deposit(current_shop, pattern, current_shop_administrator)
    end
    render 'new_deposit'
  end

  def use_deposit
    amount = params[:amount].to_i
    @user.with_lock do
      @deposit_usages = @user.consume(current_shop, amount, current_shop_administrator)
    end
    render 'use_deposit'
  end
end
