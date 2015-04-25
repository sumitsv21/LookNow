class CreateAttributeHistories < ActiveRecord::Migration
  def change
    create_table :attribute_histories do |t|
      t.string :entity, :null => false, :limit => 50
      t.column :entity_id, :bigint, :null => false
      t.string :attribute_name, :null => false, :limit => 100
      t.string :from_value, :limit => 1024
      t.string :to_value, :limit => 1024
      t.string :user_id, :limit => 100, :default => nil
      t.string :reason, :limit => 100, :default => nil
      t.string :comments, :limit => 255, :default => nil
      t.timestamps null: false
    end
    add_index :attribute_histories, [:entity_id]
    add_index :attribute_histories, [:created_at]
  end
end