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

ActiveRecord::Schema[7.1].define(version: 2024_08_18_113308) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "claims", force: :cascade do |t|
    t.text "reason"
    t.integer "price_cents"
    t.bigint "subscription_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "new", null: false
    t.index ["subscription_id"], name: "index_claims_on_subscription_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discount_codes", force: :cascade do |t|
    t.integer "discount_percentage"
    t.string "code"
    t.bigint "insurance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insurance_id"], name: "index_discount_codes_on_insurance_id"
  end

  create_table "insurances", force: :cascade do |t|
    t.string "name"
    t.integer "price_cents"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_insurances_on_company_id"
    t.index ["name"], name: "index_insurances_on_name", unique: true
  end

  create_table "prescriptions", force: :cascade do |t|
    t.string "medicine_name"
    t.bigint "user_id", null: false
    t.bigint "vet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_prescriptions_on_user_id"
    t.index ["vet_id"], name: "index_prescriptions_on_vet_id"
  end

  create_table "scheduled_appointments", force: :cascade do |t|
    t.datetime "date"
    t.bigint "user_id", null: false
    t.bigint "vet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_scheduled_appointments_on_user_id"
    t.index ["vet_id"], name: "index_scheduled_appointments_on_vet_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "insurance_id", null: false
    t.datetime "starts_on", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "discount_code_id"
    t.datetime "end_date", null: false
    t.index ["discount_code_id"], name: "index_subscriptions_on_discount_code_id"
    t.index ["insurance_id"], name: "index_subscriptions_on_insurance_id"
    t.index ["user_id", "insurance_id"], name: "index_subscriptions_on_user_id_and_insurance_id", unique: true
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_admin", default: false, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vets", force: :cascade do |t|
    t.string "name"
    t.bigint "insurance_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["insurance_id"], name: "index_vets_on_insurance_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "claims", "subscriptions"
  add_foreign_key "discount_codes", "insurances"
  add_foreign_key "prescriptions", "users"
  add_foreign_key "prescriptions", "vets"
  add_foreign_key "scheduled_appointments", "users"
  add_foreign_key "scheduled_appointments", "vets"
  add_foreign_key "subscriptions", "discount_codes"
  add_foreign_key "subscriptions", "insurances"
  add_foreign_key "subscriptions", "users"
  add_foreign_key "vets", "insurances"
end
