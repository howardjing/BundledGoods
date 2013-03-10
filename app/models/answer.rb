class Answer < ActiveRecord::Base
  
  belongs_to :question
  
  validates_presence_of :question
  validate :demo_answer_must_be_optimal
  
  delegate :user, :number, to: :question
  
  attr_accessible :content
  serialize :content, JSON
  
  def value
    if content['choice'] == 'goods'
      question.bundle(content['goods'])
    elsif content['choice'] == 'combo'
      question.combo_witheffect
    else
      0
    end
  end
  
  private
  
def demo_answer_must_be_optimal
    if should_validate?
      if question.optimal_value > value
        logger.debug "CONTENT: #{content}"
        logger.debug "THE OPTIMAL VALUE: #{question.optimal_value}"
        logger.debug "THE GIVEN VALUE: #{value}"
        errors[:base] << "This is not an optimal answer"
      end
    end
  end
  
  def should_validate?
    question.demo? && content['expired'] == false
  end
end
