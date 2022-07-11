# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  def guest_sign_in
    user = EndUser.guest
    sign_in user
    flash[:notice] = 'ゲストユーザーでログインしました'
    redirect_to root_path
  end

  protected

  # ログイン後のパスを変更
  def after_sign_in_path_for(resource)
    root_path
  end

  # ログアウト後のパスを変更
  def after_sign_out_path_for(resource)
    root_path
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
