class MediumCategoryController < ApplicationController
  before_action :set_item ,only:[:show]
  def show
    @small_category_items = SmallCategory.select("small_category")
    @items = Item.where(large_category_id: @item.large_category_id).where(medium_category_id: @item.medium_category_id).where.not(status: :stopped)
  end

end
