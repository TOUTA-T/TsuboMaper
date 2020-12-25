class RecordsController < ApplicationController
  before_action :set_record, only: [:show, :edit, :update, :destroy, :before_treatment, :during_treatment]
  before_action :authenticate_store!, only: [:index, :edit, :update, :destroy]

  def index
    @records = Record.where(user_id:current_store.id)
  end

  def new
    @record = Record.new
    @user = User.last.id
  end

  def edit
  end

  def show
    @comments = @record.comments
    @comment = @record.comments.build
  end


  def create
    @record = Record.new(record_params)
    @record.user_id = User.last.id
    if params[:back]
      render :new
    else
      if @record.save
        redirect_to before_treatment_record_path(@record), notice: "カルテが生成されました！"
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

  def before_treatment

  end

  def during_treatment
    @comments = @record.comments
    @comment = @record.comments.build
  end

  def storetop
    @users = User.all
      if params[:display_id].present?
        @users = @users.where(display_id:params[:display_id])
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
