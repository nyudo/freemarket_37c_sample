class CategoryController < ApplicationController

  def index
    @category = LargeCategory.select("large_category")
    @mcategory = MediumCategory.select("medium_category")
    @scategory = SmallCategory.select("small_category")
  end

  def show
    @items = Item.where(large_category_id: @item.large_category_id).where(medium_category_id: @item.medium_category_id).where(small_category_id: @item.small_category_id)
  end


end
