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

ActiveRecord::Schema[7.0].define(version: 20_220_512_173_243) do
  create_table 'cars', force: :cascade do |t|
    t.string 'model'
    t.string 'owner'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'comments', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'commentable_id'
    t.string 'commentable_type'
    t.text 'body'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'events', force: :cascade do |t|
    t.string 'name'
    t.text 'content'
    t.boolean 'done', default: false, null: false
    t.datetime 'finished_at'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'comments_count'
    t.index ['user_id'], name: 'index_events_on_user_id'
  end

  create_table 'events_tags', id: false, force: :cascade do |t|
    t.integer 'event_id'
    t.integer 'tag_id'
  end

  create_table 'items', force: :cascade do |t|
    t.string 'name', null: false
    t.boolean 'done', default: false, null: false
    t.datetime 'finished_at'
    t.integer 'event_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'profiles', force: :cascade do |t|
    t.string 'country'
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'roles', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'code', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'tags', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.string 'email'
    t.integer 'role_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.json 'settings', default: '{"notifications": false}', null: false
    t.integer 'state'
    t.integer 'comments_count'
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'items', 'events'
end
