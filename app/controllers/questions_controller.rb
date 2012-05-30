class QuestionsController < ApplicationController
  def new
    survey = Survey.find_by_id(params[:survey_id])
    @question = survey.questions.build
  end

  def create
    survey = Survey.find_by_id(params[:survey_id])
    @question = survey.questions.build(params[:question])
    if @question.save
      redirect_to edit_survey_question_path(survey, @question), :notice => 'Question was successfully created.'
    else
      render :action => 'new'
    end
  end

  def update
    survey = Survey.find_by_id(params[:survey_id])
    @question = survey.questions.find_by_id(params[:id])
    
    if @question.update_attributes(params[:question])
      redirect_to edit_survey_question_path(survey, @question), :notice => 'Question was successfully updated.'
    else
      render :action => 'edit'
    end
  end

  def edit
    survey = Survey.find_by_id(params[:survey_id])
    @question = survey.questions.find_by_id(params[:id])
  end

  def destroy
    survey = Survey.find_by_id(params[:survey_id])
    @question = survey.questions.find_by_id(params[:id])
    @question.destroy
    redirect_to edit_survey_path(survey), :notice => 'Question was successfully deleted.'
  end

  def index
    @survey = Survey.find_by_id(params[:survey_id])
    @questions = @survey.questions
  end

  def show
    survey = Survey.find_by_id(params[:survey_id])
    @question = survey.questions.find_by_id(params[:id])
  end
end
