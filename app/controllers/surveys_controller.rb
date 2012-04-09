class SurveysController < ApplicationController
  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(params[:survey])
    if @survey.save
      redirect_to edit_survey_path(@survey), :notice => 'Survey was successfully created.'
    else
      render :action => 'new'
    end
  end

  def update
    @survey = Survey.find(params[:id])
    if @survey.update_attributes(params[:survey])
      redirect_to @survey, :notice => 'Survey was successfully updated.'
    else
      render :action => 'edit'
    end
  end

  def edit
    @survey = Survey.find(params[:id])
  end

  def destroy
    @survey = Survey.find(params[:id])
    @survey.destroy
    redirect_to surveys_path, :notice => 'Survey was successfully destroyed.'
  end

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end
end
