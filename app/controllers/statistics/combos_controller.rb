class Statistics::CombosController < Statistics::BaseController
  def index
  end

  def show
    @user = params[:id].to_s.classify.constantize.new
  end
end