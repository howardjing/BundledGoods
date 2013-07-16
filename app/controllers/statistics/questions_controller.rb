class Statistics::QuestionsController < Statistics::BaseController
  def index
  end

  def new
    @numbers = params[:numbers]
    @question = OverallQuestion.new(@numbers)
  end
end