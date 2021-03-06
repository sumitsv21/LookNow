class PropertyInfosController < ApplicationController

  include HomeHelper

  def create
    if params[:name] == "price"
      details = params["price_value"]
    elsif params[:name] == "infra"
      details = params["infra_value"]
    end
    @property_info = PropertyInfo.create(property_id: 1, name: params[:name], comments: params[:comments], details: details.to_json)
    tweet(params[:comments])
    @property_infos = get_live_tweets
    respond_to do |format|
      format.js
    end
  end

  def get_feed
    @property_infos = get_live_tweets_for_property
    render 'get_feed.js'
  end

end
