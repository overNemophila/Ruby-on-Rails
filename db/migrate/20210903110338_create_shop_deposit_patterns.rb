class CreateShopDepositPatterns < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_deposit_patterns do |t|
      t.references :shop, null: false
      t.integer :amount, null: false
      t.integer :bonus_amount, null: false
      t.timestamps null: false
    end
  end
end
