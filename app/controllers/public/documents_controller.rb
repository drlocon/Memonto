class Public::DocumentsController < ApplicationController
  before_action :authenticate_end_user!
  before_action :set_document, only: [:show, :edit, :update]
  
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
  end

  def edit
  end
  
  def update
    if @document.update(document_params)
      flash[:notice] = '編集内容の保存に成功しました'
      redirect_to document_path(params[:id])
    else
      flash[:alert] = '入力に誤りがあります'
      render :edit
    end
  end

  def word_search
  end

  def tag_search
  end
  
  private
  
  def document_params
    params.require(:document).permit(:content, :feeling)
  end
  
  def set_document
    @document = Document.find(params[:id])
  end
end
