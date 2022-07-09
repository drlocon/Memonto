class Public::DocumentsController < ApplicationController
  before_action :authenticate_end_user!
  
  def new
    @document_new = Document.new
  end
  
  def create
    @document_new = Document.new(document_params)
    @document_new.end_user_id = current_end_user.id
    if @document_new.save
      flash[:notice] = '記録を登録しました'
      redirect_to documents_path
    else
      @document_new = Document.new
      flash[:alert] = '入力に誤りがあります'
      render :new
    end
  end

  def index
    @documents = Document.where(end_user_id: current_end_user.id).includes(:end_user).order("created_at DESC")
  end

  def show
    @document = Document.find(params[:id])
  end

  def edit
  end

  def word_search
  end

  def tag_search
  end
  
  private
  
  def document_params
    params.require(:document).permit(:content, :feeling)
  end
end
