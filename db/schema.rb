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

ActiveRecord::Schema.define(version: 20_170_311_165_628) do
  create_table 'authors', force: :cascade do |t|
    t.string   'first_name'
    t.string   'last_name'
    t.text     'description'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
  end

  create_table 'authors_books', id: false, force: :cascade do |t|
    t.integer 'book_id'
    t.integer 'author_id'
    t.index ['author_id'], name: 'index_authors_books_on_author_id'
    t.index ['book_id'], name: 'index_authors_books_on_book_id'
  end

  create_table 'bestsellers', force: :cascade do |t|
    t.integer  'book_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['book_id'], name: 'index_bestsellers_on_book_id'
  end

  create_table 'billing_addresses', force: :cascade do |t|
    t.string   'first_name'
    t.string   'last_name'
    t.string   'addressee'
    t.string   'city'
    t.string   'zip'
    t.string   'country'
    t.string   'phone'
    t.boolean  'identical'
    t.integer  'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_billing_addresses_on_user_id'
  end

  create_table 'books', force: :cascade do |t|
    t.string   'name'
    t.string   'short_description'
    t.float    'price'
    t.text     'description'
    t.string   'dimensions'
    t.string   'materials'
    t.datetime 'created_at',        null: false
    t.datetime 'updated_at',        null: false
    t.date     'public_year'
    t.string   'alt'
    t.integer  'category_id'
    t.index ['category_id'], name: 'index_books_on_category_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string   'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'countries', force: :cascade do |t|
    t.string   'name'
    t.string   'zip'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'newests', force: :cascade do |t|
    t.integer  'book_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['book_id'], name: 'index_newests_on_book_id'
  end

  create_table 'orders', force: :cascade do |t|
    t.string   'number'
    t.text     'items', default: "--- []\n"
    t.string   'discont'
    t.string   'delivery_methods'
    t.string   'delivery_cost'
    t.string   'total_cost'
    t.string   'card_number'
    t.string   'card_name'
    t.string   'cvv'
    t.string   'mmyy'
    t.integer  'orders_state_id'
    t.integer  'user_id'
    t.datetime 'created_at',                            null: false
    t.datetime 'updated_at',                            null: false
    t.index ['orders_state_id'], name: 'index_orders_on_orders_state_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'orders_states', force: :cascade do |t|
    t.string   'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'photos', force: :cascade do |t|
    t.string   'file',       null: false
    t.integer  'book_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['book_id'], name: 'index_photos_on_book_id'
  end

  create_table 'reviews', force: :cascade do |t|
    t.string   'title'
    t.text     'text'
    t.integer  'rating'
    t.string   'status', default: 'unprocessed'
    t.integer  'book_id'
    t.integer  'user_id'
    t.datetime 'created_at',                         null: false
    t.datetime 'updated_at',                         null: false
    t.index ['book_id'], name: 'index_reviews_on_book_id'
    t.index ['user_id'], name: 'index_reviews_on_user_id'
  end

  create_table 'shipping_addresses', force: :cascade do |t|
    t.string   'first_name'
    t.string   'last_name'
    t.string   'addressee'
    t.string   'city'
    t.string   'zip'
    t.string   'country'
    t.string   'phone'
    t.boolean  'identical'
    t.integer  'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_shipping_addresses_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string   'name'
    t.boolean  'admin', default: false
    t.string   'password'
    t.datetime 'created_at',                             null: false
    t.datetime 'updated_at',                             null: false
    t.string   'email',                  default: '',    null: false
    t.string   'encrypted_password',     default: '',    null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string   'current_sign_in_ip'
    t.string   'last_sign_in_ip'
    t.string   'provider'
    t.string   'uid'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end
