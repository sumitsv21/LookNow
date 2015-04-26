class HomeController < ApplicationController

	include HomeHelper

	def index
		#@property_infos = PropertyInfo.order("created_at DESC").first(10)
		@property_infos = get_live_tweets_for_property
		@polygon = []
		@polygon1 = []
		boundaries = []
		boundaries1 = []
		JSON.parse(Property.last.boundary).each do |n|
			boundaries << [ n.first, n.last ]
		end
		JSON.parse(Property.first.boundary).each do |n|
			boundaries1 << [ n.first, n.last ]
		end
		@polygon = boundaries
		@polygon1 = boundaries1
	end
	
end
