class HomeController < ApplicationController


	def index
		@property_infos = PropertyInfo.order("created_at DESC").first(10)
	end
	
end
