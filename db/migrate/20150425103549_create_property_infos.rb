class CreatePropertyInfos < ActiveRecord::Migration
  def change
    create_table :property_infos do |t|
      t.column :property_id, :bigint, :null=>false
      t.string :name
      t.string :details
      t.string :source
      t.text :comments
      t.timestamps null: false
    end
  end
end
