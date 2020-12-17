class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @records = Record.where(user_id:current_user.id)
  end

  def new
    @record = Record.new
    @record.user_id = current_user.id
  end

  def edit
  end

  def create
    @record = Record.new(record_params)
    @record.user_id = current_user.id
    if params[:back]
      render :new
    else
      if @record.save
        # RecordMailer.record_mail(@record).deliver メール設定（仮）
        redirect_to records_path, notice: "投稿されました！"
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if @record.update(record_params)
        format.html { redirect_to records_path, notice: '編集は正常に行われました' }
        format.json { render :index, status: :ok, location: @record }
      else
        format.html { render :edit }
        format.json { render json: @record.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @record.destroy
    respond_to do |format|
      format.html { redirect_to records_url, notice: '投稿を削除しました' }
      format.json { head :no_content }
    end
  end

  private

  def set_record
    @record = Record.find(params[:id])
  end

  def record_params
    params.require(:record).permit(:comment, :pain_a, :pain_b, :pain_c, :person_in_charge, :pain_level, :expect_picture, :expect_picture_cache, :treatment_picture, :treatment_picture_cache, :storage_picture, :storage_picture_cache, { label_ids: [] })
  end
end
