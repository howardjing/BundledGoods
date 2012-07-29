class PagesController < ApplicationController

  def instructions
    Explanation.create user_id: current_user.id, question_id: Question.first.id, content: "Viewing instructions page"
  end

  def thanks
    @final_score = current_user.calculate_final_score
  end

  private
  def require_user
    unless !current_user.nil?
      redirect_to new_user_path
    end
  end
end
