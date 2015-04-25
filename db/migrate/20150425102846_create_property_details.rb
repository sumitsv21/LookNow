class CreatePropertyDetails < ActiveRecord::Migration
  def change
    create_table :property_details do |t|
      t.column :property_id, :bigint, :null=>false
      t.string :name
      t.string :value
      t.text :comments
      t.timestamps null: false
    end
  end
end
