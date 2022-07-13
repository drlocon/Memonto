class Public::DocumentsController < ApplicationController
  before_action :authenticate_end_user!
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  def new
    @document_new = Document.new
  end

  def create
    @document_new = Document.new(document_params)
    @document_new.end_user_id = current_end_user.id
    tag_list = params[:document][:tag_name].split(',')
    if @document_new.save
      @document_new.save_tags(tag_list)
      flash[:notice] = "記録を登録しました"
      redirect_to documents_path
    else
      @document_new = Document.new
      flash[:alert] = "入力に誤りがあります"
      render :new
    end
  end

  def index
    @tags = Tag.all
    @documents = current_end_user.documents.includes(:end_user).all.order("created_at DESC")
  end

  def show
  end

  def edit
    @tag_list = @document.tags.pluck(:name).join(',')
  end

  def update
    tag_list = params[:document][:tag_name].split(',')
    if @document.update(document_params)
      @document.save_tags(tag_list)
      flash[:notice] = "編集内容を保存しました"
      redirect_to document_path(params[:id])
    else
      flash[:alert] = "入力に誤りがあります"
      render :edit
    end
  end

  def destroy
    @document.destroy
    flash[:notice] = "削除しました"
    redirect_to documents_path
  end

  def word_search
    @words_search = current_end_user.documents.word_search(params[:keyword])
  end

  def tag_search
    @tag = Tag.find(params[:tag_id])
    @tags_search = @tag.documents
  end

  private

  def document_params
    params.require(:document).permit(:content, :feeling)
  end

  def set_document
    @document = current_end_user.documents.find(params[:id])
  end
end
