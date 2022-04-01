class AddDescriptionToDepositPatterns < ActiveRecord::Migration[6.1]
  def change
    add_column :shop_deposit_patterns, :name, :string, after: :bonus_amount
    add_column :shop_deposit_patterns, :description, :string, after: :name
  end
end
