# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_09_24_115802) do

  create_table "deposit_usages", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "deposit_id", null: false
    t.bigint "shop_id", null: false
    t.bigint "shop_administrator_id"
    t.integer "amount", null: false
    t.datetime "used_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["deposit_id"], name: "index_deposit_usages_on_deposit_id"
    t.index ["shop_administrator_id"], name: "index_deposit_usages_on_shop_administrator_id"
    t.index ["shop_id", "used_at"], name: "index_deposit_usages_on_shop_id_and_used_at"
    t.index ["user_id"], name: "index_deposit_usages_on_user_id"
  end

  create_table "deposits", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "shop_id", null: false
    t.bigint "shop_administrator_id"
    t.integer "amount", null: false
    t.integer "bonus_amount", null: false
    t.datetime "deposited_at", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_administrator_id"], name: "index_deposits_on_shop_administrator_id"
    t.index ["shop_id", "deposited_at"], name: "index_deposits_on_shop_id_and_deposited_at"
    t.index ["user_id", "shop_id"], name: "index_deposits_on_user_id_and_shop_id"
  end

  create_table "shop_administrators", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "shop_id", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_shop_administrators_on_email", unique: true
    t.index ["reset_password_token"], name: "index_shop_administrators_on_reset_password_token", unique: true
    t.index ["shop_id"], name: "index_shop_administrators_on_shop_id"
    t.index ["unlock_token"], name: "index_shop_administrators_on_unlock_token", unique: true
  end

  create_table "shop_deposit_patterns", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.integer "amount", null: false
    t.integer "bonus_amount", null: false
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["shop_id"], name: "index_shop_deposit_patterns_on_shop_id"
  end

  create_table "shops", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_authentications", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.string "secret"
    t.datetime "token_expires_at"
    t.text "params"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_authentications_on_user_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "name"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
