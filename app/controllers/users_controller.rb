class UsersController < ApplicationController
  def index
    @user = User.find_by(id: 1)         #idは仮置きです
  end

  def show
    @user = User.find_by(id: 1)         #idは仮置きです
    @item = @user.items.find_by(id: 1)   #idは仮置きです
    @item_images = Image.where(item_id: 1)#idは仮置きです
  end

  def in_progress
    @user = User.find_by(id: 1)#idは仮置きです
    @items = @user.items.where.not(buyer_id: nil).where("status IS NULL OR status = ?", 1).order("created_at DESC")
  end

  def completed
    @user = User.find_by(id: 1)#idは仮置きです
    @items = @user.items.where.not(buyer_id: nil).where(status: "2").order("created_at DESC")
  end

  def purchase
    @user = User.find_by(id: 1) #idは仮置きです.ログイン機能実装したらcurrent_user.idとします。
    @items = Item.where(buyer_id: @user.id).where("status IS NULL OR status = ?", 1).order("created_at DESC")

  end


  def purchased
    @user = User.find_by(id: 1)#idは仮置きです
    @items = Item.where(buyer_id: @user.id).where(status: "2").order("created_at DESC")
  end

  def listing

    @user = User.find_by(id: 1)#idは仮置きです
    @items = @user.items.where(buyer_id: nil).order("created_at DESC")
  end

end
