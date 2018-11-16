class UserDetailsController < ApplicationController

  before_action :create_user_detail, only:[:edit]

  def new
    if user_signed_in?
      @userdetail = UserDetail.new
    else
      redirect_to new_user_user_detail_path
    end
  end

  def create
    @userdetail = UserDetail.new(user_detail_params)
    if @userdetail.save
      redirect_to root_path
    else
      redirect_to new_user_user_detail_path, alert: '住所登録に失敗しました'
    end
  end

  def edit
    if @userdetail.user_id != current_user.id
      redirect_to root_path, notice: "権限がありません"
    end
  end

  def update
    @user = User.find(current_user.id)
    @userdetail = @user.user_detail
    if @userdetail.update(user_detail_params)
      redirect_to root_path, notice: '変更が完了しました'
    else
      redirect_to edit_user_user_detail_path, alert: '住所編集に失敗しました'
    end
  end

private

  def user_detail_params
    params.require(:user_detail).permit(:family_name, :first_name, :kana_family_name, :kana_first_name, :birthday, :prefecture, :city, :address, :residential_name, :phone_number, :postal_code, :profile, :user_image).merge(user_id: current_user.id)
  end

  def create_user_detail
    @user = User.find(current_user.id)
    @userdetail = @user.user_detail
    if @userdetail.nil?
      redirect_to new_user_user_detail_path(current_user.id)
    end
  end
end
