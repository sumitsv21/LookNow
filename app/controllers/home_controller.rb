class HomeController < ApplicationController


	def index
		@property_infos = PropertyInfo.order("created_at DESC").first(10)
		
		@polygon = []
		boundaries = []
		JSON.parse(Property.last.boundary).each do |n|
			boundaries << { :lat => n.first, :lng => n.last }
		end
		@polygon = [boundaries]
	end
	
end
