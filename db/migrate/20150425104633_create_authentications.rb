class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.integer :user_id
      t.string :provider
      t.string :uid
      t.string :image
      t.text :token
      t.text :token_secret

      t.timestamps null: false
    end
  end
end
