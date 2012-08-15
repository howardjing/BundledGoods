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

  def experiment
    question_number = Question.current_question_number current_user.id

    if question_number > Question.last.number
      redirect_to edit_users_path
    else
      @question = Question.find_by_number question_number
      puts "the question number is: #{@question.number}"

      # if the question has been started, get the final answer
      current_answer = current_user.final_answer @question.id
      if current_answer.nil?
        @current_answer = nil
      elsif current_answer.class == Good
        @current_answer = current_answer.name.gsub(" ", "_")
      elsif current_answer.class == Bundle
        @current_answer = current_answer.goods.map { |good| good.name.gsub(" ", "_") }.join(', ')
      else
        @current_answer = 'Combo'
      end
      puts "The current answer is: #{@current_answer}"
    end

  end

  # Methods for recording user interactions

  def start
    question = Question.find_by_id params[:id]
    puts "creating question start for question number: #{question.number}"
    response = current_user.responses.find_by_question_id params[:id]

    if response.nil?
      response = current_user.responses.build question_id: params[:id]
      response.save
    else
      response.update_attribute :misc, "#{response.misc}; User tried to start question again at time #{Time.now}"
    end
    millis = response.question.millis_left(current_user.id)
    render json: { millis_left: millis, random: response.question.random_duration? }.to_json
  end

  def explanation
    content = params[:content];
    puts "content is: #{content}"
    create_row_helper(Explanation, content);
    render nothing: true
  end

  def answer
    puts "Recording answer for user: #{current_user.id}, 
                               question: #{params[:id]},
                               select: #{params[:checked]}"
    response = current_user.responses.find_by_question_id params[:id]
    answer = response.answers.build name: params[:answer_id], selected: params[:checked] unless response.nil?
    answer.save
    render nothing: true
  end

  # end the last response that a user made
  def end

    response = current_user.responses.find_by_question_id params[:id]
    if response.end_time.nil?
      response.update_attributes :end_time => Time.now, :misc => params[:misc]
    else
      misc = params[:misc].blank? ? "User tried to end question again at #{Time.now}" : params[:misc]
      puts "misc is: #{misc}"
      response.update_attribute :misc, "#{response.misc}; #{misc}"
    end

    if !response.question.last?
      redirect_to experiment_path
    else
      redirect_to edit_users_path
    end

  end

  private
  
  def require_signed_in
    redirect_to new_users_path if current_user.nil?
  end

  def create_row_helper(klass, content)
    klass.create(
        user_id: current_user.id,
        question_id: params[:id],
        content: content
    )
  end

end
