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
    respond_to do |format|
      format.js
    end
  end

  def get_feed
    @tweets = get_live_tweets #returns an object. Run a loop and call .text on each to get the tweet. user.profile_image_url_https gives image
    render 'get_feed.js'
  end

end
