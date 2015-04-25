class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      # t.string :status
      # t.column :user_id
      t.float :latitude
      t.float :longitude
      t.text :boundary
      # t.string :type
      # t.string :sub_type
      t.string :landmark
      t.timestamps null: false
    end
  end
end
