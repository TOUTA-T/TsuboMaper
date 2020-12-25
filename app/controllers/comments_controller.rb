class CommentsController < ApplicationController
  before_action :set_record, only: [:create, :edit, :update]
  # コメントを保存、投稿するためのアクション
  def create
    @record = Record.find(params[:record_id])
    @comment = @record.comments.build(comment_params)
    respond_to do |format|
      if @comment.save
        format.js { render :index }
        format.html { redirect_to during_treatment_path(@record) }
      else
        format.html { redirect_to during_treatment_path(@record), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @comment = @record.comments.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @comment = @record.comments.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
         flash.now[:notice] = 'コメントが編集されました'
         format.js { render :index }
      else
         flash.now[:notice] = 'コメントの編集に失敗しました'
         format.js { render :edit_error }
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:record_id, :content)
  end

  def set_record
  @record = Record.find(params[:record_id])
  end
end
