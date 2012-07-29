class UsersController < ApplicationController
  def new
    puts "hi"
    @user = User.new
    puts "Hihi"
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      redirect_to instructions_path
    else
      render :action => 'new'
    end
  end
 
  def edit
    @user = current_user
    # end the last question (will be removed later)
    response = @user.responses.find_by_question_id Question.last.id

    if !response.nil?
      if response.end_time.nil?
        response.update_attribute :end_time, Time.now
      else
        response.update_attribute :misc, 
        "#{response.misc}; User tried to end question again at #{Time.now}"
      end
    else
      puts "Tried to end question without appropriate response"
    end
  end

  def update
    @user = current_user
    if @user.update_attributes params[:user]
      redirect_to thanks_path
    else 
      render :action => 'edit'
    end
  end
end
