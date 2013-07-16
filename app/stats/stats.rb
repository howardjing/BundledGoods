class Stats
  # throwaway class, probably shouldn't do things this way
  def self.average_clicks_per_question
    questions.map{ |q| q.question_stats.size }.sum / questions.count.to_f
  end

  def self.average_time_between_all_clicks_per_question
    questions = Question.everything.includes(:question_stats).find_all{ |q| q.question_stats.count > 2 }

    questions.map { |question| 
      stats = question.question_stats.order("created_at")
      second = stats.slice(1, stats.length)
      first = stats.slice(0, stats.length - 1)

      second.zip(first).map{ |s, f| s.created_at - f.created_at }.sum / second.length
    }.sum / questions.count.to_f 
  end

  def self.questions
    Question.everything.includes(:question_stats)
  end

end