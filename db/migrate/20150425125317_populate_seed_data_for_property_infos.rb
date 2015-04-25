class PopulateSeedDataForPropertyInfos < ActiveRecord::Migration
  def change
    PropertyInfo.create({:property_id => 1, :source => "https://localhost:3000", :name => 'price', :details => {:from_price => 1000, :to_price => 1100, :delta_price => 100}.to_json, :comments => "price increased"})
    PropertyInfo.create({:property_id => 1, :source => "https://localhost:3000", :name => 'dispute', :details => {:type => 'local'}.to_json, :comments => "two got killed"})
    PropertyInfo.create({:property_id => 1, :source => "https://localhost:3000", :name => 'infra', :details => {:type => 'college', :date_delta => '1 year'}.to_json, :comments => "two got killed"})
    PropertyInfo.create({:property_id => 1, :source => "https://localhost:3000", :name => 'nature', :details => {:type => 'water_table', :value => 'high'}.to_json, :comments => "Water level high or low"})
    PropertyInfo.create({:property_id => 1, :source => "https://localhost:3000", :name => 'nature', :details => {:type => 'earth_quake', :value => true}.to_json, :comments => "Earthquake prone"})

    PropertyInfo.create({:property_id => 2, :source => "https://twitter.com", :name => 'price', :details => {:from_price => 1000, :to_price => 1100, :delta_price => 100}.to_json, :comments => "price increased"})
    PropertyInfo.create({:property_id => 2, :source => "https://twitter.com", :name => 'dispute', :details => {:type => 'government'}.to_json, :comments => "Oil land"})
    PropertyInfo.create({:property_id => 2, :source => "https://twitter.com", :name => 'infra', :details => {:type => 'Hospital', :date_delta => '2 years'}.to_json, :comments => "Close to city"})
    PropertyInfo.create({:property_id => 2, :source => "https://twitter.com", :name => 'nature', :details => {:type => 'water_table', :value => 'low'}.to_json, :comments => "Water level high or low"})

  end
end
