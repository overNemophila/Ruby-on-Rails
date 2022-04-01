class CreateDepositUsages < ActiveRecord::Migration[6.1]
  def change
    create_table :deposit_usages do |t|
      t.references :user, null: false
      t.references :deposit, null: false
      t.references :shop, null: false, index: false # added manually
      t.integer :amount, null: false
      t.datetime :used_at, null: false

      t.timestamps null: false
    end

    add_index :deposit_usages, [:shop_id, :used_at]
  end
end
