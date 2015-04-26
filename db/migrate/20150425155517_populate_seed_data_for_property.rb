class PopulateSeedDataForProperty < ActiveRecord::Migration
  def change
  	#Property.create({:status => 'Active', :user_id => 1, :listed_by => 1, :boundary => [[28.54980087, 77.19740295], [28.63999939, 77.21179962], [28.54529953, 77.19229889], [28.50860023, 77.21749878], [28.66629982, 77.06800079]].to_json, :property_type => "Unused"})
  	Property.create({:status => 'Active', :user_id => 1, :listed_by => 1, :boundary => [[12.936348678099279,77.60448217391968 ], [12.935313479341499,77.60426759719849], [12.935167087251248,77.60525465011597], [12.93622319969078,77.60541558265686], [12.936348678099279,77.60448217391968]].to_json, :property_type => "Unused"})
  	Property.create({:status => 'Active', :user_id => 1, :listed_by => 1, :boundary => [[12.934670399162057,77.60790467262268], [12.93450309347779,77.6083391904831], [12.934079600463006,77.60816752910614], [12.934262591360065,77.60771691799164], [12.934670399162057,77.60790467262268]].to_json, :property_type => "Unused"})
  end
end
