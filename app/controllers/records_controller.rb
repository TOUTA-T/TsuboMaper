class RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @records = Record.new
  end

  def edit
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def set_record
  end

  def record_params
    params.require(:record).permit(:comment, :pain_a, :pain_b, :pain_c, :person_in_charge, :pain_level, :expect_picture, :expect_picture_cache, :treatment_picture, :treatment_picture_cache, :storage_picture, :storage_picture_cache)
  end
end
