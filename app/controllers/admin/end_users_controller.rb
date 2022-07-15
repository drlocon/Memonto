class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_end_user, only: [:show, :edit, :update]
  
  def show
  end

  def edit
  end
  
  def update
    if @end_user.update(end_user_params)
      flash[:notice] = "ユーザー情報が更新されました"
      redirect_to admin_end_user_path(@end_user)
    else
      flash[:alert] = "ユーザー情報を更新できませんできた"
      render :edit
    end
  end

  def word_search
    @end_users_search = EndUser.word_search(params[:keyword]).page(params[:page]).per(8)
  end
  
  private
  
  def end_user_params
    params.require(:end_user).permit(:name, :email, :is_deleted)
  end
  
  def set_end_user
    @end_user = EndUser.find(params[:id])
  end
end
