class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :status
      t.integer :user_id, :null => false
      t.integer :listed_by, :null => false
      t.float :latitude
      t.float :longitude
      t.text :boundary
      t.string :property_type
      t.string :sub_type
      t.string :landmark

      t.timestamps null: false
    end
  end
end
