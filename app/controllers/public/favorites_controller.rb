class Public::FavoritesController < ApplicationController
  before_action :set_favorite, only: [:create, :destroy]
  
  def create
    @favorite = current_end_user.favorites.new(document_id: document.id)
    @favorite.save
    render 'replace_btn'
  end
  
  def destroy
    @favorite = current_end_user.favorites.find_by(document_id: document.id)
    @favorite.destroy
    render 'replace_btn'
  end
  
  private
  
  def set_favorite
    @document = Document.find(params[:document_id])
  end
end
