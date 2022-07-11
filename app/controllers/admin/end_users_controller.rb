class Admin::EndUsersController < ApplicationController
  before_action :authenticate_admin!
  
  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
  end

  def word_search
  end
end
