class CategoryController < ApplicationController

  def index
    @category = LargeCategory.select("large_category")
    @mcategory = MediumCategory.select("medium_category")
    @scategory = SmallCategory.select("small_category")
  end

  def large_category
    @items = Item.where(large_category_id: params[:large_category_id])
    @medium_category_items = MediumCategory.select("medium_category")
  end

  def medium_category
    @medium_category_items = large_category.where(medium_category_id: params[:medium_category_id])
  end

  def small_category
    @small_category_items = medium_category.where(small_category_id: params[:small_category_id])
  end

end
