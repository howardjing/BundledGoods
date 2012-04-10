class QuestionResponse < ActiveRecord::Base
  
  belongs_to :survey_response
  belongs_to :question
  
end
