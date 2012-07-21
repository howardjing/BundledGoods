class PagesController < ApplicationController
  include ResponsesHelper
  before_filter :require_user

  def thanks
    content = end_question(Question.last.id)
    Response.create(user_id: current_user.id, question_id: Question.last.id, content: content)
    
    @final_score = current_user.calculate_final_score
  end
  
  def instructions
    content = begin_experiment(Question.first.id)
    Response.create(user_id: current_user.id, question_id: Question.first.id, content: content)
  end

  private
  def require_user
    unless !current_user.nil?
      redirect_to new_user_path
    end
  end
end
