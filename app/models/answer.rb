class Answer < ActiveRecord::Base
  
  belongs_to :question
  validates_presence_of :question
  delegate :user, to: :question
  
  attr_accessible :content
  serialize :content, JSON
  
  def value
    if content['choice'] == 'goods'
      question.bundle(content['goods'])
    elsif content['choice'] == 'combo'
      question.combo
    else
      0
    end
  end
end
