class StatsController < ApplicationController

  def create
    logger.debug "Creating a new stat..."
    question = Question.find_by_id(params[:question_id])
    stat = QuestionStat.new
    stat.question = question
    stat.content = params[:content]
    stat.save
    logger.debug "Creating new stat for question: #{stat.question_id}"
    logger.debug "with content: #{stat.content}"
    render nothing: true
  end
  
end