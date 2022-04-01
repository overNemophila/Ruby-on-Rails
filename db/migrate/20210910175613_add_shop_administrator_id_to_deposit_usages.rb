class AddShopAdministratorIdToDepositUsages < ActiveRecord::Migration[6.1]
  def change
    add_reference :deposit_usages, :shop_administrator, after: :shop_id
  end
end
