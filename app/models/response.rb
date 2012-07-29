class Response < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :question
  has_many :answers
  
  before_create :generate_random_duration

private
  
  def generate_random_duration 
    self.duration = BetaRandom.get_seconds
  end

end
