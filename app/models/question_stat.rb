class QuestionStat < ActiveRecord::Base

  belongs_to :question, touch: true
  validates_presence_of :question

  scope :ascending,  lambda { order("question_stats.created_at ASC") }
  scope :descending, lambda { order("question_stats.created_at DESC") }

  scope :statements, lambda { where("question_stats.content like 'Menu%'") }
  scope :selections, lambda { where("question_stats.content like 'Good%' or question_stats.content like 'Combo%'") }
  scope :good, lambda { where("question_stats.content like 'Good%'") }
  scope :combo, lambda { where("question_stats.content like 'Combo%'") }

  scope :good_selected,    lambda { where("question_stats.content like 'Good%true'") }
  scope :good_deselected,  lambda { where("question_stats.content like 'Good%false'") }
  scope :combo_selected,   lambda { where("question_stats.content like 'Combo%true'") }
  scope :combo_deselected, lambda { where("question_stats.content like 'Combo%false'") } 

  scope :created_after, lambda { |created_at| where("question_stats.created_at > ?", created_at) }


  def user
    question.user
  end

  def real?
    !question.demo?
  end

  def stat_type
    content.split(' ', 2).first
  end

  def combo?
    stat_type == 'Combo'
  end

  def good?
    stat_type == 'Good'
  end

  # if the content ends in true, then it was selected
  def selected?
    content.rpartition(" ").last == 'true'
  end

  def good_number
    if good?
      content.split(" ", 3)[1].to_i
    end
  end

end
