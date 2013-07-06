class QuestionStat < ActiveRecord::Base

  belongs_to :question, touch: true
  validates_presence_of :question

  scope :ascending, lambda { order("question_stats.created_at ASC") }

  scope :good_selected,    lambda { where("question_stats.content like 'Good%true'") }
  scope :good_deselected,  lambda { where("question_stats.content like 'Good%false'") }
  scope :combo_selected,   lambda { where("question_stats.content like 'Combo%true'") }
  scope :combo_deselected, lambda { where("question_stats.content like 'Combo%false'") }  

  def user
    question.user
  end

  def stat_type
    content.split(' ', 2).first
  end

end
