class ExperimentsController < ApplicationController
  before_filter :require_user
  before_filter :load_current_question
  
  def show
    redirect_to thanks_path unless @question
  end
  
  def update
    logger.debug "The chosen goods: #{params[:good_numbers]}"
    logger.debug "The chosen combo: #{params[:combo]}"
    
    # save answer 
    answer = @question.build_answer
    if params[:good_numbers]
      goods = params[:good_numbers].map(&:to_i)
      answer.content = { choice: :goods, goods: goods }
    elsif params[:combo]
      answer.content = { choice: :combo }
    else
      answer.content = { choice: :unanswered }
    end
    answer.save
    
    # move to next question
    current_user.current_question = @question.next_question
    current_user.save
    
    # go to next step
    if current_user.current_question
      redirect_to experiment_path
    else
      redirect_to thanks_path
    end
  end
  
  private
  
  def load_current_question
    @question = current_user.current_question
  end
end