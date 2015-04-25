class HomeController < ApplicationController


	def index
		@polygon = []
		boundaries = []
		JSON.parse(Property.last.boundary).each do |n|
			boundaries << { :lat => n.first, :lng => n.last }
		end
		@polygon = [boundaries]
	end
	
end
