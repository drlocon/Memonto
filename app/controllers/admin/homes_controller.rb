class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @end_users = EndUser.all.page(params[:page]).per(12)
  end
end
