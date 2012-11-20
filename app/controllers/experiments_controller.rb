class ExperimentsController < ApplicationController
  before_filter :require_user
  
  def show
    @question = current_user.current_question
  end
  
  def update
    logger.debug "The chosen goods: #{params[:good_numbers]}"
    logger.debug "The chosen combo: #{params[:combo]}"
    redirect_to experiment_path
  end
  
end