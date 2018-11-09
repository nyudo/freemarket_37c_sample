class UsersController < ApplicationController
  def index
    @user = User.find_by(id: 1)         #idは仮置きです
  end

  def show
    @user = User.find(id: 1)         #idは仮置きです
    @item = @user.items.find(id: 1)   #idは仮置きです
    @item_images = Image.where(item_id: 1)
    @userdetail = UserDetail.find(id: 1)#idは仮置きです
  end

  def edit
  end

  def in_progress
    @user = User.find_by(id: 1)#idは仮置きです
  end

  def completed
    @user = User.find_by(id: 1)#idは仮置きです
  end

  def purchase
    @user = User.find_by(id: 1)#idは仮置きです
  end

  def purchased
    @user = User.find(1) #idは仮置きです.ログイン機能実装したらcurrent_user.idとします。
    @items = Item.where(buyer_id: @user.id)
  end

  def listing

    @user = User.find_by(id: 1)#idは仮置きです
    @items = @user.items.order("created_at DESC")
  end

  def set_profile
    @userdetail = UserDetail.find(params[ :profile]).merge(user_id: 1)
  end

end






