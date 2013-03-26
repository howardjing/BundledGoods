class ExperimentsController < ApplicationController
  before_filter :require_user
  before_filter :load_current_question
  
  
  def instructions
  end
  
  def show
    redirect_to thanks_path unless @question
  end
  
  def wait
    @seconds_remaining = @question.previous_question.time_remaining
    respond_to do |format|
      format.html
      format.json { render json: { id: @question.previous_question.id, secondsRemaining: @seconds_remaining } }
    end
  end
  
  def update
    logger.debug "The chosen goods: #{params[:good_numbers]}"
    logger.debug "The chosen combo: #{params[:combo]}"
    
    # save answer 
    answer = @question.build_answer
    if params[:good_numbers]
      goods = params[:good_numbers].map(&:to_i)
      content = { 'choice' => 'goods', 'goods' => goods }
    elsif params[:combo]
      content = { 'choice' => 'combo' }
    else
      content = { 'choice' => 'unanswered' }
    end
    
    answer.content = content.merge( 'expired' => params[:expired] == 'true' )
    
    if answer.save
      # move to next question
      current_user.current_question = @question.next_question
      current_user.save
      alert = nil
    else
      alert = "You have answered this question incorrectly, please try again."
    end
    
    # go to next step
    redirect_to next_path, alert: alert
  end
  
  # called by the javascript timer
  def start_question
    logger.debug "Received start question with time: #{params[:start_time]}"
    if @question.started?
      logger.error 'Question #{@question.id} has already been started at #{@question.time_started}'
    else
      start_time = Time.zone.parse(params[:start_time]) # rescue DateTime.now 
      @question.time_started = start_time
      @question.save
    end
    head :ok
  end
  
  private
  
  def load_current_question
    @question = current_user.current_question
  end
  
  def next_path
    if current_user.current_question
      wait_experiment_path
    else
      edit_user_path(current_user)
    end
  end
end