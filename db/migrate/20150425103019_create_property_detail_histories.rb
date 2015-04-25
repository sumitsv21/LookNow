class CreatePropertyDetailHistories < ActiveRecord::Migration
  def change
    create_table :property_detail_histories do |t|
      t.column :property_detail_id, :bigint, :null=>false
      t.string      :from, :limit => 20
      t.string      :to, :limit => 20, :null=>false
      t.string      :event , :limit=>50
      t.string      :user_id, :limit =>20
      t.string      :change_reason, :limit => 50
      t.string      :change_sub_reason, :limit => 50
      t.timestamps null: false
    end
  end
end
