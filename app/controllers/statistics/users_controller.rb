class Statistics::UsersController < Statistics::BaseController

  def index
    @users = User.includes(:question_stats)
  end

  def show
    @user = User.where(id: params[:id]).includes(:questions, :question_stats).first
  end

end