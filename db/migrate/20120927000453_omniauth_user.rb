class OmniauthUser < ActiveRecord::Migration
  def up
    create_table :users, :force => true do |t|
      t.string :email
      t.boolean :active, :default => true
      t.string :name

      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.datetime :last_request_at
      t.datetime :current_login_at
      t.datetime :last_login_at
      t.string   :current_login_ip
      t.string   :last_login_ip
      t.string   :persistence_token

      t.timestamps
    end
  end

  def down
    create_table "users", :force => true do |t|
      t.integer  "facebook_uid",       :limit => 8
      t.string   "access_token"
      t.string   "email"
      t.datetime "created_at",                                     :null => false
      t.datetime "updated_at",                                     :null => false
      t.string   "persistence_token"
      t.integer  "login_count",                     :default => 0, :null => false
      t.integer  "failed_login_count",              :default => 0, :null => false
      t.datetime "last_request_at"
      t.datetime "current_login_at"
      t.datetime "last_login_at"
      t.string   "current_login_ip"
      t.string   "last_login_ip"
      t.boolean  "active"
      t.integer  "location_id",        :limit => 8
    end
  end
end
