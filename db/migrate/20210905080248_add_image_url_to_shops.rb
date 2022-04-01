class AddImageUrlToShops < ActiveRecord::Migration[6.1]
  def change
    add_column :shops, :image_url, :string, after: :name
  end
end
