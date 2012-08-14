class PagesController < ApplicationController

  def instructions
    Explanation.create user_id: current_user.id, question_id: Question.first.id, content: "Viewing instructions page"
  end
  
  def instructions1
  end
  
  def instructions2
  end
  
  def instructions3
  end

  def thanks
    @final_score = current_user.calculate_final_score
  end

  def demo1
  end
  
  def demo2
  end
  
  def demo3
  end
  
  def demo4
  end
  
  private
  def require_user
    unless !current_user.nil?
      redirect_to new_users_path
    end
  end
end
