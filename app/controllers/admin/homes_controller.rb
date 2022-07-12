class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  
  def top
    @end_users = EndUser.all
  end
end
