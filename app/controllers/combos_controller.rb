class CombosController < ApplicationController

  before_filter :fetch_combo, :only => [:edit, :update, :destroy]

  def edit

  end

  def update
    if @combo.update_attributes(params[:combo])
      flash[:success] = 'Combo was successfully updated'
      redirect_to edit_question_path(@question)
    else
      render :action => 'edit'
    end
  end

  private
  def fetch_combo
    @question = Question.find_by_id(params[:question_id])
    @combo = @question.combo
  end
end