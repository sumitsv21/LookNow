class HomeController < ApplicationController

	include HomeHelper

	def index
		#@property_infos = PropertyInfo.order("created_at DESC").first(10)
		@property_infos = get_live_tweets_for_property
		@polygon = []
		boundaries = []
		JSON.parse(Property.last.boundary).each do |n|
			boundaries << [ n.first, n.last ]
		end
		@polygon = boundaries
	end
	
end
