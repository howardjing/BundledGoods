class BundlesController < ApplicationController

  def new
    question = Question.find_by_id(params[:question_id])
    @bundle = question.bundles.build
  end

  def create
    question = Question.find_by_id(params[:question_id])
    @bundle = question.bundles.build(params[:bundle])

    if @bundle.save
      redirect_to edit_question_path(@bundle.question)
    else
      render :action => 'new'
    end
  end

  def edit
    question = Question.find_by_id(params[:question_id])
    @bundle = question.bundles.find_by_id(params[:id])
  end

  def update
    question = Question.find_by_id(params[:question_id])
    @bundle = question.bundles.find_by_id(params[:id])

    if @bundle.update_attributes(params[:bundle])
      redirect_to edit_question_path(@bundle.question)
    else
      render :action => 'edit'
    end
  end

  def destroy
    question = Question.find_by_id(params[:question_id])
    bundle = question.bundles.find_by_id(params[:id])
    bundle.destroy
    flash[:notice] = "Bundle was successfully destroyed."
    redirect_to edit_question_path(bundle.question)
  end
end
