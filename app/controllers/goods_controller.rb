class GoodsController < ApplicationController

  def new
    question = Question.find_by_id(params[:question_id])
    @good = question.goods.build
  end

  def create
    question = Question.find_by_id(params[:question_id])
    @good = question.goods.build(params[:good])

    if @good.save
      redirect_to edit_question_path(@good.question)
    else
      render :action => :new
    end
  end

  def edit
    question = Question.find_by_id(params[:question_id])
    @good = question.goods.find_by_id(params[:id])
  end

  def update
    question = Question.find_by_id(params[:question_id])
    @good = question.goods.find_by_id(params[:id])

    if @good.update_attributes(params[:good])
      redirect_to edit_question_path(@good.question)
    else
      render :action => :edit
    end
  end

  def destroy
    question = Question.find_by_id(params[:question_id])
    good = question.goods.find_by_id(params[:id])
    good.destroy
    flash[:notice] = "Good was successfully deleted."
    redirect_to edit_question_path(good.question)
  end


end
