class SurveyResponse < ActiveRecord::Base
  
  has_many :question_responses
  belongs_to :user
  
end
