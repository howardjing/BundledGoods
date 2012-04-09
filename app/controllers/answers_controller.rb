class AnswersController < ApplicationController
  def new
    survey = Survey.find_by_id(params[:survey_id])
    question = survey.questions.find_by_id(params[:question_id])
    @answer = question.answers.build
  end

  def create
    survey = Survey.find_by_id(params[:survey_id])
    question = survey.questions.find_by_id(params[:question_id])
    @answer = question.answers.build(params[:answer])
    
    if @answer.save
      redirect_to edit_survey_question_path(@answer.question.survey, @answer.question), :notice => 'Answer was successfully created.'
    else
      render :action => 'new'
    end
  end

  def update
    survey = Survey.find_by_id(params[:survey_id])
    question = survey.questions.find_by_id(params[:question_id])
    @answer = question.find_by_id(params[:id])
    
    if @answer.update_attributes(params[:answer])
      redirect_to edit_survey_question_path(@answer.question.survey, @answer.question), :notice => 'Answer was successfully updated.'
    else
      render :action => 'edit'
    end
  end

  def edit
    survey = Survey.find_by_id(params[:survey_id])
    question = survey.questions.find_by_id(params[:question_id])
    @answer = question.find_by_id(params[:id])
  end

  def destroy
    survey = Survey.find_by_id(params[:survey_id])
    question = survey.questions.find_by_id(params[:question_id])
    @answer = question.find_by_id(params[:id])
    @answer.destroy
    redirect_to edit_survey_question_path(@answer.question.survey, @answer.question), :notice => 'Answer was deleted updated.'
  end

  def index
    survey = Survey.find_by_id(params[:survey_id])
    question = survey.questions.find_by_id(params[:question_id])
    @answers = question.answers
  end

  def show
    survey = Survey.find_by_id(params[:survey_id])
    question = survey.questions.find_by_id(params[:question_id])
    @answer = question.answers.find_by_id(params[:id]) 
  end
end
