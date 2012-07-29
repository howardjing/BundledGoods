class PagesController < ApplicationController
  include ResponsesHelper
  before_filter :require_user

  def thanks
    response = current_user.responses.find_by_question_id Question.last.id

    if !response.nil? && response.end_time.nil?
      response.update_attribute :end_time, Time.now
    else
      response.update_attribute :misc, "#{response.misc}; User tried to end question again at #{Time.now}"
    end
    @final_score = current_user.calculate_final_score
  end
  
  def instructions
    Explanation.create user_id: current_user.id, question_id: Question.first.id, content: "Viewing instructions page"
  end

  private
  def require_user
    unless !current_user.nil?
      redirect_to new_user_path
    end
  end
end
