class AddShopAdministratorIdToDeposits < ActiveRecord::Migration[6.1]
  def change
    add_reference :deposits, :shop_administrator, after: :shop_id
  end
end
