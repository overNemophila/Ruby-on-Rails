class CreateDeposits < ActiveRecord::Migration[6.1]
  def change
    create_table :deposits do |t|
      t.references :user, null: false, index: false # added manually
      t.references :shop, null: false, index: false # added manually
      t.integer :amount, null: false
      t.integer :bonus_amount, null: false
      t.datetime :deposited_at, null: false

      t.timestamps null: false
    end

    add_index :deposits, [:user_id, :shop_id]
    add_index :deposits, [:shop_id, :deposited_at]
  end
end
