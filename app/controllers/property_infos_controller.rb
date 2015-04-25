class PropertyInfosController < ApplicationController
  def create
    if params[:name] == "price"
      details = params["price_value"]
    elsif params[:name] == "infra"
      details = params["infra_value"]
    end
    @property_info = PropertyInfo.create(property_id: 1, name: params[:name], comments: params[:comments], details: details.to_json)
    respond_to do |format|
      format.js
    end
  end

  def get_feed
    @tweets = []
    render 'get_feed.js'
  end
end
