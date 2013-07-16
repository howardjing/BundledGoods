class Statistics::QuestionsController < Statistics::BaseController
  def index
  end

  def new
    @numbers = params[:numbers].split(",").map(&:to_i)
    @question = OverallQuestion.new(@numbers)
  end
end