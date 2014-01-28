class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   "name"
      t.string   "email"
      t.string   "string"
      t.datetime "created_at",  :null => false
      t.datetime "updated_at",  :null => false
      t.string   "password_digest"
      t.string   "remember_token"
      t.string   "avatars"
      t.string   "country"
      t.boolean  "admin", :default => false
      t.string   "confirmed"
      t.string   "signer"
      t.string   "shares"
      t.string   "provider"
      t.string   "uid"

      t.timestamps
    end
  end
end
