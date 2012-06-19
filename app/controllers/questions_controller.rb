class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      redirect_to edit_question_path(@question), :notice => 'Question was successfully created.'
    else
      render :action => 'new'
    end
  end

  def update
    @question = Question.find_by_id(params[:id])
    
    if @question.update_attributes(params[:question])
      redirect_to edit_question_path(@question), :notice => 'Question was successfully updated.'
    else
      render :action => 'edit'
    end
  end

  def edit
    @question = Question.find_by_id(params[:id])
  end

  def destroy
    @question = Question.find_by_id(params[:id])
    @question.destroy
    redirect_to questions_path, :notice => 'Question was successfully deleted.'
  end

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find_by_id(params[:id])
  end
end
