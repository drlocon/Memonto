class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :set_end_user
  before_action :ensure_guest_user, only: [:edit, :update, :confirm, :withdrawal]

  def show
    @documents = @end_user.documents
  end

  def edit
  end

  def update
    if @end_user.update(end_user_params)
      flash[:notice] = "編集内容を保存しました"
      redirect_to end_user_path(@end_user)
    else
      flash[:alert] = "入力に誤りがあります"
      render :edit
    end
  end

  def confirm
  end

  def withdrawal
    @end_user.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end
  
  def favorites
    @favorites = Favorite.where(end_user_id: current_end_user.id).pluck(:document_id)
    @favorite_list = Document.find(@favorites)
    @favorite_list = Kaminari.paginate_array(@favorite_list).page(params[:page])
  end

  private

  def end_user_params
    params.require(:end_user).permit(:name, :profile_image)
  end

  def set_end_user
    @end_user = current_end_user
  end

  def ensure_guest_user
    @end_user = EndUser.find(params[:id])
    if @end_user.name == "guestuser"
      flash[:alert] = "ゲストユーザーはプロフィール編集機能が使えません"
      redirect_to end_user_path(current_end_user)
    end
  end
end
