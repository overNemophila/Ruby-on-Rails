class CreateUserAuthentications < ActiveRecord::Migration[6.1]
  def change
    create_table :user_authentications do |t|
      t.references :user, null: false
      t.string :provider
      t.string :uid
      t.string :token
      t.string :secret
      t.datetime :token_expires_at
      t.text :params

      t.timestamps null: false
    end
  end
end
