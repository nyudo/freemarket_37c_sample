class UsersController < ApplicationController

  before_action :set_user ,only:[:index,:in_progress,:completed,:purchase,:purchased,:listing, :logout]
  # before_action :set_current_user, only: [:create,:edit,:update]
  before_action :create_user_detail ,only:[:edit]

  def index
    @item = Item.where(user_id: current_user.id)
    @items = Item.be_bought(@user.id).where.not(status: 2).order("created_at DESC")
    @bought_items = Item.be_bought(@user.id).where(status: 2).order("created_at DESC")
  end

  def show
    @user = User.find(params[:id])
    @userdetail = @user.user_detail
    # @user.user_detail = UserDetail.new if @user.user_detail.blank?
    # @userdetail = UserDetail.find_by(params[:user_id])
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id
      redirect_to root_path, notice: "権限がありません"
    # @userdetail = UserDetail.find_by(params[:user_id])
    # if current_user.id == @userdetail.user_id
    else
      # @user = User.find(params[:id])
      @user.user_detail = UserDetail.new if @user.user_detail.blank?
      @userdetail = UserDetail.find_by(params[:user_id])
    end
    # else
    #   redirect_to new_user_user_detail_path
    # end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to users_path
  end

  def in_progress
    @items = @user.items.be_sold.where.not(status: :received).order("created_at DESC")
  end

  def completed
    @items = @user.items.be_sold.where(status: :received).order("created_at DESC")
  end

  def purchase
    @items = Item.be_bought(@user.id).where.not(status: :received).order("created_at DESC")
  end

  def purchased
    @items = Item.be_bought(@user.id).where(status: :received).order("created_at DESC")
  end

  def listing
    @items = @user.items.where(status: :stopped).order("created_at DESC") .or @user.items.where(status: :displayed).order("created_at DESC")
  end

  def logout
  end

  private

  def user_params
    params.require(:user).permit(:nickname ,:id, user_detail_attributes:[:profile])
  end

  def userdetail_params
    params.require(:user_detail).permit(:profile).merge(user_id: current_user.id)
  end

  def set_profile
    @userdetail = UserDetail.find(params[ :profile]).merge(user_id: current_user.id)
  end

  def set_user
    @user = User.find_by(id: current_user.id)
  end

  def create_user_detail
    @user = User.find(current_user.id)
    @userdetail = @user.user_detail
    if @userdetail.nil?
      redirect_to new_user_user_detail_path(current_user.id)
    end
  end
end





