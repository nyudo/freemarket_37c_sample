class UsersController < ApplicationController

   before_action :set_user ,only:[:index,:in_progress,:completed,:purchase,:purchased,:listing]

  def index
  end

  def show
    @user = User.find_by(id: params[:id])         #idは仮置きです
  end

  def in_progress
    # @items = @user.items.be_sold.where("status IS NULL OR status = ?", 1).order("created_at DESC")
    @items = @user.items.be_sold.where.not(status: 2).order("created_at DESC")
  end

  def completed
    # @items = @user.items.be_sold.where(status: "2").order("created_at DESC")
    @items = @user.items.be_sold.where(status: 2).order("created_at DESC")
  end

  def purchase
    # @items = Item.be_bought(@user.id).where("status IS NULL OR status = ?", 1).order("created_at DESC")
    @items = Item.be_bought(@user.id).where.not(status: 2).order("created_at DESC")
  end


  def purchased
    # @items = Item.be_bought(@user.id).where(status: "2").order("created_at DESC")
    @items = Item.be_bought(@user.id).where(status: 2).order("created_at DESC")
  end

  def listing
    @items = @user.items.where(status: 0 || 4 ).order("created_at DESC")
  end

  private

  def set_user
    @user = User.find_by(id: 1)#idは仮置きです。ログイン機能実装したらcurrent_user.idとします。
  end

end
