# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170308015705) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 191
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 191,   null: false
    t.string   "resource_type", limit: 191,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 191
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "activity_sqhds", force: :cascade do |t|
    t.string   "title",          limit: 191
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "subdistrict_id", limit: 4,   default: 1
  end

  add_index "activity_sqhds", ["subdistrict_id"], name: "fk_rails_0d7048cc4e", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 191, default: "", null: false
    t.string   "encrypted_password",     limit: 191, default: "", null: false
    t.string   "reset_password_token",   limit: 191
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 191
    t.string   "last_sign_in_ip",        limit: 191
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.float    "postage",                limit: 24
    t.integer  "subdistrict_id",         limit: 4
    t.string   "sms_phone",              limit: 191
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree
  add_index "admin_users", ["subdistrict_id"], name: "fk_rails_3215fdb9a2", using: :btree

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.string   "idname",         limit: 191
    t.string   "type",           limit: 191
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "count",          limit: 4
    t.integer  "state",          limit: 4
    t.integer  "aptable_id",     limit: 4
    t.string   "aptable_type",   limit: 191
    t.integer  "subdistrict_id", limit: 4
  end

  add_index "appointments", ["aptable_type", "aptable_id"], name: "index_appointments_on_aptable_type_and_aptable_id", using: :btree
  add_index "appointments", ["subdistrict_id"], name: "fk_rails_8e5577c7fd", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "banners", force: :cascade do |t|
    t.string   "title",          limit: 191
    t.integer  "position",       limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "banner_type",    limit: 191
    t.integer  "type_id",        limit: 4
    t.integer  "subdistrict_id", limit: 4,   default: 1
  end

  add_index "banners", ["subdistrict_id"], name: "fk_rails_7d50a4c40b", using: :btree

  create_table "cart_items", force: :cascade do |t|
    t.integer  "product_id",     limit: 4
    t.integer  "user_id",        limit: 4
    t.integer  "count",          limit: 4
    t.float    "amount",         limit: 24
    t.integer  "state",          limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "order_id",       limit: 4
    t.integer  "subdistrict_id", limit: 4
  end

  add_index "cart_items", ["order_id"], name: "index_cart_items_on_order_id", using: :btree
  add_index "cart_items", ["product_id"], name: "index_cart_items_on_product_id", using: :btree
  add_index "cart_items", ["subdistrict_id"], name: "fk_rails_6d8172cbfc", using: :btree
  add_index "cart_items", ["user_id"], name: "index_cart_items_on_user_id", using: :btree

  create_table "classifies", force: :cascade do |t|
    t.string   "title",      limit: 191
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "communities", force: :cascade do |t|
    t.string   "name",           limit: 191
    t.integer  "subdistrict_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "communities", ["subdistrict_id"], name: "index_communities_on_subdistrict_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 191
    t.string   "phone",      limit: 191
    t.string   "community",  limit: 191
    t.string   "address",    limit: 191
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "row_order",  limit: 4
    t.string   "area",       limit: 191
    t.string   "street",     limit: 191
    t.string   "province",   limit: 191
    t.string   "city",       limit: 191
  end

  add_index "contacts", ["user_id"], name: "index_contacts_on_user_id", using: :btree

  create_table "customer_services", force: :cascade do |t|
    t.string   "name",           limit: 191
    t.string   "phone",          limit: 191
    t.integer  "subdistrict_id", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "customer_services", ["subdistrict_id"], name: "index_customer_services_on_subdistrict_id", using: :btree

  create_table "examinations", force: :cascade do |t|
    t.integer  "user_info_id", limit: 4
    t.date     "date"
    t.float    "sbp",          limit: 24
    t.float    "dbp",          limit: 24
    t.float    "pulse",        limit: 24
    t.float    "bo",           limit: 24
    t.float    "fetalheart",   limit: 24
    t.float    "glu",          limit: 24
    t.float    "chol",         limit: 24
    t.float    "ua",           limit: 24
    t.float    "fat",          limit: 24
    t.float    "bmr",          limit: 24
    t.float    "water",        limit: 24
    t.float    "height",       limit: 24
    t.float    "weight",       limit: 24
    t.float    "bmi",          limit: 24
    t.float    "waistline",    limit: 24
    t.float    "hipline",      limit: 24
    t.float    "whr",          limit: 24
    t.float    "bmd_t",        limit: 24
    t.float    "bmd_z",        limit: 24
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "type",         limit: 191
  end

  add_index "examinations", ["date"], name: "index_examinations_on_date", using: :btree
  add_index "examinations", ["user_info_id"], name: "index_examinations_on_user_info_id", using: :btree

  create_table "home_blocks", force: :cascade do |t|
    t.integer  "admin_user_id", limit: 4
    t.string   "title",         limit: 191
    t.integer  "ranking",       limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "home_blocks", ["admin_user_id"], name: "index_home_blocks_on_admin_user_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "title",              limit: 191
    t.string   "photo_file_name",    limit: 191
    t.string   "photo_content_type", limit: 191
    t.integer  "photo_file_size",    limit: 4
    t.datetime "photo_updated_at"
    t.integer  "imageable_id",       limit: 4
    t.string   "imageable_type",     limit: 191
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "photo_type",         limit: 191
  end

  add_index "images", ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id", using: :btree

  create_table "news", force: :cascade do |t|
    t.integer  "news_sort_id",   limit: 4
    t.string   "title",          limit: 191
    t.text     "content",        limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "subdistrict_id", limit: 4
  end

  add_index "news", ["news_sort_id"], name: "index_news_on_news_sort_id", using: :btree
  add_index "news", ["subdistrict_id"], name: "fk_rails_5785f550fc", using: :btree

  create_table "news_sorts", force: :cascade do |t|
    t.integer  "rank",           limit: 4
    t.string   "title",          limit: 191
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "subdistrict_id", limit: 4
  end

  add_index "news_sorts", ["subdistrict_id"], name: "fk_rails_97499036d9", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "seq",            limit: 191
    t.integer  "state",          limit: 4
    t.string   "pay_way",        limit: 191
    t.float    "price",          limit: 24
    t.integer  "contact_id",     limit: 4
    t.integer  "user_id",        limit: 4
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.float    "postage",        limit: 24,    default: 0.0
    t.datetime "paid_time"
    t.integer  "subdistrict_id", limit: 4
    t.string   "order_type",     limit: 191,   default: "精品超市"
    t.text     "cart_item_info", limit: 65535
  end

  add_index "orders", ["subdistrict_id"], name: "fk_rails_c3a7ece3a4", using: :btree

  create_table "p1_sportmonthlies", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "count",          limit: 4
    t.integer  "year",           limit: 4
    t.integer  "month",          limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "subdistrict_id", limit: 4, default: 1
  end

  add_index "p1_sportmonthlies", ["subdistrict_id"], name: "fk_rails_a99218879b", using: :btree
  add_index "p1_sportmonthlies", ["user_id"], name: "index_sport_monthlies_on_user_id", using: :btree

  create_table "p1_sports", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.date     "date"
    t.integer  "count",          limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "platform",       limit: 191
    t.integer  "version",        limit: 4
    t.integer  "subdistrict_id", limit: 4,   default: 1
  end

  add_index "p1_sports", ["date"], name: "index_sports_on_date", using: :btree
  add_index "p1_sports", ["subdistrict_id"], name: "fk_rails_4416303325", using: :btree
  add_index "p1_sports", ["user_id"], name: "index_sports_on_user_id", using: :btree

  create_table "p1_sportweeklies", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "count",          limit: 4
    t.integer  "year",           limit: 4
    t.integer  "cweek",          limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "subdistrict_id", limit: 4, default: 1
  end

  add_index "p1_sportweeklies", ["subdistrict_id"], name: "fk_rails_239ba97fd8", using: :btree
  add_index "p1_sportweeklies", ["user_id"], name: "index_sport_weeklies_on_user_id", using: :btree

  create_table "p1_sportyearlies", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "count",          limit: 4
    t.integer  "year",           limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "subdistrict_id", limit: 4, default: 1
  end

  add_index "p1_sportyearlies", ["subdistrict_id"], name: "fk_rails_039bd99631", using: :btree
  add_index "p1_sportyearlies", ["user_id"], name: "index_sport_yearlies_on_user_id", using: :btree

  create_table "p2_sportmonthlies", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "count",          limit: 4
    t.integer  "year",           limit: 4
    t.integer  "month",          limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "subdistrict_id", limit: 4, default: 2
  end

  add_index "p2_sportmonthlies", ["subdistrict_id"], name: "fk_rails_a99218879b", using: :btree
  add_index "p2_sportmonthlies", ["user_id"], name: "index_sport_monthlies_on_user_id", using: :btree

  create_table "p2_sports", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.date     "date"
    t.integer  "count",          limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "platform",       limit: 191
    t.integer  "version",        limit: 4
    t.integer  "subdistrict_id", limit: 4,   default: 2
  end

  add_index "p2_sports", ["date"], name: "index_sports_on_date", using: :btree
  add_index "p2_sports", ["subdistrict_id"], name: "fk_rails_4416303325", using: :btree
  add_index "p2_sports", ["user_id"], name: "index_sports_on_user_id", using: :btree

  create_table "p2_sportweeklies", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "count",          limit: 4
    t.integer  "year",           limit: 4
    t.integer  "cweek",          limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "subdistrict_id", limit: 4, default: 2
  end

  add_index "p2_sportweeklies", ["subdistrict_id"], name: "fk_rails_239ba97fd8", using: :btree
  add_index "p2_sportweeklies", ["user_id"], name: "index_sport_weeklies_on_user_id", using: :btree

  create_table "p2_sportyearlies", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "count",          limit: 4
    t.integer  "year",           limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "subdistrict_id", limit: 4, default: 2
  end

  add_index "p2_sportyearlies", ["subdistrict_id"], name: "fk_rails_039bd99631", using: :btree
  add_index "p2_sportyearlies", ["user_id"], name: "index_sport_yearlies_on_user_id", using: :btree

  create_table "p3_sportmonthlies", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "count",          limit: 4
    t.integer  "year",           limit: 4
    t.integer  "month",          limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "subdistrict_id", limit: 4, default: 3
  end

  add_index "p3_sportmonthlies", ["subdistrict_id"], name: "fk_rails_a99218879b", using: :btree
  add_index "p3_sportmonthlies", ["user_id"], name: "index_sport_monthlies_on_user_id", using: :btree

  create_table "p3_sports", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.date     "date"
    t.integer  "count",          limit: 4
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "platform",       limit: 191
    t.integer  "version",        limit: 4
    t.integer  "subdistrict_id", limit: 4,   default: 3
  end

  add_index "p3_sports", ["date"], name: "index_sports_on_date", using: :btree
  add_index "p3_sports", ["subdistrict_id"], name: "fk_rails_4416303325", using: :btree
  add_index "p3_sports", ["user_id"], name: "index_sports_on_user_id", using: :btree

  create_table "p3_sportweeklies", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "count",          limit: 4
    t.integer  "year",           limit: 4
    t.integer  "cweek",          limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "subdistrict_id", limit: 4, default: 3
  end

  add_index "p3_sportweeklies", ["subdistrict_id"], name: "fk_rails_239ba97fd8", using: :btree
  add_index "p3_sportweeklies", ["user_id"], name: "index_sport_weeklies_on_user_id", using: :btree

  create_table "p3_sportyearlies", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "count",          limit: 4
    t.integer  "year",           limit: 4
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "subdistrict_id", limit: 4, default: 3
  end

  add_index "p3_sportyearlies", ["subdistrict_id"], name: "fk_rails_039bd99631", using: :btree
  add_index "p3_sportyearlies", ["user_id"], name: "index_sport_yearlies_on_user_id", using: :btree

  create_table "ping_requests", force: :cascade do |t|
    t.string   "object_type", limit: 191
    t.string   "ping_id",     limit: 191
    t.boolean  "complete"
    t.integer  "amount",      limit: 4
    t.string   "subject",     limit: 191
    t.string   "body",        limit: 191
    t.string   "client_ip",   limit: 191
    t.string   "extra",       limit: 191
    t.string   "order_no",    limit: 191
    t.string   "channel",     limit: 191
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "order_id",    limit: 4
    t.string   "metadata",    limit: 191
  end

  add_index "ping_requests", ["order_id"], name: "fk_rails_975af3fa0e", using: :btree

  create_table "product_banners", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "product_sorts", force: :cascade do |t|
    t.string   "title",          limit: 191
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "subdistrict_id", limit: 4
  end

  add_index "product_sorts", ["subdistrict_id"], name: "fk_rails_33238a7e68", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title",           limit: 191
    t.float    "price",           limit: 24
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.integer  "count",           limit: 4
    t.text     "detail",          limit: 65535
    t.integer  "state",           limit: 4
    t.integer  "classify_id",     limit: 4
    t.integer  "product_sort_id", limit: 4
    t.float    "after_discount",  limit: 24
    t.datetime "expiration_time"
    t.integer  "product_type",    limit: 4,     default: 0
    t.integer  "subdistrict_id",  limit: 4
    t.integer  "initial_sales",   limit: 4,     default: 0
  end

  add_index "products", ["classify_id"], name: "index_products_on_classify_id", using: :btree
  add_index "products", ["product_sort_id"], name: "fk_rails_8c0953ced4", using: :btree
  add_index "products", ["subdistrict_id"], name: "fk_rails_4f43a87044", using: :btree

  create_table "sms_tokens", force: :cascade do |t|
    t.string   "phone",      limit: 191
    t.string   "token",      limit: 191
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "sms_tokens", ["phone"], name: "index_sms_tokens_on_phone", using: :btree

  create_table "sport_monthlies", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "count",          limit: 4
    t.integer  "year",           limit: 4
    t.integer  "month",          limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "subdistrict_id", limit: 4
  end

  add_index "sport_monthlies", ["subdistrict_id"], name: "fk_rails_a99218879b", using: :btree
  add_index "sport_monthlies", ["user_id"], name: "index_sport_monthlies_on_user_id", using: :btree

  create_table "sport_weeklies", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "count",          limit: 4
    t.integer  "year",           limit: 4
    t.integer  "cweek",          limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "subdistrict_id", limit: 4
  end

  add_index "sport_weeklies", ["subdistrict_id"], name: "fk_rails_239ba97fd8", using: :btree
  add_index "sport_weeklies", ["user_id"], name: "index_sport_weeklies_on_user_id", using: :btree

  create_table "sport_yearlies", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.integer  "count",          limit: 4
    t.integer  "year",           limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "subdistrict_id", limit: 4
  end

  add_index "sport_yearlies", ["subdistrict_id"], name: "fk_rails_039bd99631", using: :btree
  add_index "sport_yearlies", ["user_id"], name: "index_sport_yearlies_on_user_id", using: :btree

  create_table "sports", force: :cascade do |t|
    t.integer  "user_id",        limit: 4
    t.date     "date"
    t.integer  "count",          limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "platform",       limit: 191
    t.integer  "version",        limit: 4
    t.integer  "subdistrict_id", limit: 4
  end

  add_index "sports", ["date"], name: "index_sports_on_date", using: :btree
  add_index "sports", ["subdistrict_id"], name: "fk_rails_4416303325", using: :btree
  add_index "sports", ["user_id"], name: "index_sports_on_user_id", using: :btree

  create_table "subdistricts", force: :cascade do |t|
    t.string   "province",    limit: 191
    t.string   "city",        limit: 191
    t.string   "subdistrict", limit: 191
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "district",    limit: 191
  end

  create_table "user_infos", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "nickname",      limit: 191
    t.string   "identity_card", limit: 191
    t.integer  "sex",           limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.date     "birth"
    t.string   "slogan",        limit: 191
    t.string   "pay_password",  limit: 191
    t.string   "name",          limit: 191
    t.string   "nation",        limit: 191
    t.string   "addr",          limit: 191
    t.string   "community",     limit: 191
  end

  add_index "user_infos", ["user_id"], name: "index_user_infos_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 191, default: "", null: false
    t.string   "encrypted_password",     limit: 191, default: "", null: false
    t.string   "reset_password_token",   limit: 191
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 191
    t.string   "last_sign_in_ip",        limit: 191
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "authentication_token",   limit: 30
    t.string   "phone",                  limit: 191
    t.integer  "subdistrict_id",         limit: 4
  end

  add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true, using: :btree
  add_index "users", ["phone"], name: "index_users_on_phone", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["subdistrict_id"], name: "fk_rails_30f1da5737", using: :btree

  add_foreign_key "activity_sqhds", "subdistricts"
  add_foreign_key "admin_users", "subdistricts"
  add_foreign_key "appointments", "subdistricts"
  add_foreign_key "banners", "subdistricts"
  add_foreign_key "cart_items", "subdistricts"
  add_foreign_key "communities", "subdistricts"
  add_foreign_key "customer_services", "subdistricts"
  add_foreign_key "home_blocks", "admin_users"
  add_foreign_key "news", "news_sorts"
  add_foreign_key "news", "subdistricts"
  add_foreign_key "news_sorts", "subdistricts"
  add_foreign_key "orders", "subdistricts"
  add_foreign_key "ping_requests", "orders"
  add_foreign_key "product_sorts", "subdistricts"
  add_foreign_key "products", "classifies"
  add_foreign_key "products", "product_sorts"
  add_foreign_key "products", "subdistricts"
  add_foreign_key "sport_monthlies", "subdistricts"
  add_foreign_key "sport_weeklies", "subdistricts"
  add_foreign_key "sport_yearlies", "subdistricts"
  add_foreign_key "sports", "subdistricts"
  add_foreign_key "sports", "users"
  add_foreign_key "user_infos", "users"
  add_foreign_key "users", "subdistricts"
end
