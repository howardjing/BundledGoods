class QuestionsController < ApplicationController
  include ResponsesHelper

  before_filter :require_signed_in

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

    # end the previous question
    end_previous_question
  end

  # Methods for recording user interactions
  def create_question_explanation
    content = params[:content];
    puts "content is: #{content}"
    create_row_helper(Explanation, content);
    render nothing: true
  end

  def create_question_start
    response = current_user.responses.find_by_question_id params[:id]
    puts "Hitting question start, current response is: #{response}"
    if response.nil?
      response = current_user.responses.build question_id: params[:id]
      response.save
    else
      response.update_attribute :misc, "#{response.misc}; User tried to start question again at time #{Time.now}"
    end
    render nothing: true
  end


  def create_question_answer
    puts "Recording answer for user: #{current_user.id}, 
                               question: #{params[:id]},
                               select: #{params[:checked]}"
    response = current_user.responses.find_by_question_id params[:id]
    answer = response.answers.build name: params[:answer_id], selected: params[:checked] unless response.nil?
    answer.save
    render nothing: true
  end

  private
  
  def require_signed_in
    redirect_to new_user_path if current_user.nil?
  end

  def create_row_helper(klass, content)
    klass.create(
        user_id: current_user.id,
        question_id: params[:id],
        content: content
    )
  end

  def end_previous_question
    unless @question.first?
      response = current_user.responses.find_by_question_id @question.previous.id
      if !response.nil? && response.end_time.nil?
        response.update_attribute :end_time, Time.now
      else
        response.update_attribute :misc, "#{response.misc}; User tried to end question again at #{Time.now}"
      end
    end
  end

end
