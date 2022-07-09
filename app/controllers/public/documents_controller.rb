class Public::DocumentsController < ApplicationController
  before_action :authenticate_end_user!
  
  def new
    @document = Document.new
  end
  
  def create
    document = Document.new(document_params)
    if document.save
      flash[:notice] = '記録を登録しました'
      redirect_to documents_path
    else
      @document = Document.new
      flash[:alert] = '入力に誤りがあります'
      render :new
    end
  end

  def index
  end

  def show
  end

  def edit
  end

  def word_search
  end

  def tag_search
  end
  
  private
  
  def document_params
    params.require(:document).permit(:content, :feeling, :name)
  end
end
