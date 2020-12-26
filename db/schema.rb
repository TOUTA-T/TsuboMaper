ActiveRecord::Schema.define(version: 2020_12_25_085401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "record_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_comments_on_record_id"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "record_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["record_id"], name: "index_favorites_on_record_id"
    t.index ["user_id", "record_id"], name: "index_favorites_on_user_id_and_record_id", unique: true
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "labellings", force: :cascade do |t|
    t.bigint "record_id"
    t.bigint "label_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["label_id"], name: "index_labellings_on_label_id"
    t.index ["record_id"], name: "index_labellings_on_record_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name", null: false
    t.text "detail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "records", force: :cascade do |t|
    t.text "expect_picture", default: "a", null: false
    t.text "treatment_picture", default: "a", null: false
    t.text "storage_picture", default: "a", null: false
    t.string "pain_a", default: "", null: false
    t.string "pain_b", default: "", null: false
    t.string "pain_c", default: "", null: false
    t.string "person_in_charge", null: false
    t.integer "pain_level", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "store_id"
    t.index ["store_id"], name: "index_records_on_store_id"
    t.index ["user_id"], name: "index_records_on_user_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.string "representative_name", null: false
    t.string "tel", null: false
    t.boolean "payment", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_stores_on_email", unique: true
    t.index ["reset_password_token"], name: "index_stores_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "display_id", default: 11111, null: false
    t.boolean "admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "records"
  add_foreign_key "favorites", "records"
  add_foreign_key "favorites", "users"
  add_foreign_key "labellings", "labels"
  add_foreign_key "labellings", "records"
  add_foreign_key "records", "stores"
  add_foreign_key "records", "users"
end
