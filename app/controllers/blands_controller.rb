class BlandsController < ApplicationController

  def index
    @small_category_items = SmallCategory.select("small_category")
    @blands_items = Item.be_indexed.where(bland_id: params[:bland_id]).limit(4)
  end

end
