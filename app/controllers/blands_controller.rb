class BlandsController < ApplicationController

  def index
    @related_small_categories = Bland.find(params[:bland_id]).small_categories
    @blands_items = Item.be_indexed.where(bland_id: params[:bland_id]).limit(4)
  end
end
