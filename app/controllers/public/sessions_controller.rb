# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # ゲストログイン機能
  def guest_sign_in
    user = EndUser.guest
    sign_in user
    flash[:notice] = "ゲストユーザーでログインしました"
    redirect_to root_path
  end

  protected

  # ログイン後のパスを変更
  def after_sign_in_path_for(resource)
    end_user_path(@end_user.id)
  end

  # ログアウト後のパスを変更
  def after_sign_out_path_for(resource)
    root_path
  end
  
  # 退会機能
  def end_user_state
    @end_user = EndUser.find_by(email: params[:end_user][:email])
    return if !@customer
    if @customer.valid_password?(params[:end_user][:password]) && (@end_user.active_for_authentication? == false)
      flash[:alert] = "退会済みですので再度ご登録してご利用ください"
      redirect_to new_end_user_registration_path
    end
  end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
