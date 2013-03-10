class User < ActiveRecord::Base
  attr_accessible :age, :gender, :lab_number, :major, :year
  has_many :questions, order: 'created_at ASC'
  has_many :answers, through: :questions
  has_one :chosen_question, class_name: 'Question'
  belongs_to :current_question, class_name: 'Question'
    
  after_create :generate_questions
  validates_presence_of :lab_number
  
  def score
    if chosen_question.answer
      chosen_question.answer.value
    else
      0
    end
  end
  
  def scorable_questions
    questions.find_all { |question| !question.demo? }
  end

  private
  
  # there are many things wrong with this method
  def generate_questions
    logger.info 'Generating demo question...'
    demo = build_random_question number_of_goods: 3, duration: 300
    demo.instruction = Instruction.find_by_number(0)
    demo.save
    
    logger.info 'Assigning demo question to users current_question'
    update_column(:current_question_id, demo.id)
    
    logger.info 'Generating question 1'
    question1 = build_random_question number_of_goods: 3, duration: 300
    question1.instruction = Instruction.find_by_number(1)
    question1.save
    
    logger.info 'Generating question 2'
    question2 = build_random_question number_of_goods: 3, duration: 300
    question2.instruction = Instruction.find_by_number(1)
    question2.save

    logger.info 'Generating question 3'
    question3 = build_random_question number_of_goods: 4, duration: 300
    question3.instruction = Instruction.find_by_number(2)
    question3.save

    logger.info 'Generating question 4'
    question4 = build_random_question number_of_goods: 4, duration: 300
    question4.instruction = Instruction.find_by_number(2)
    question4.save
    
    logger.info 'Generating question 5'
    question5 = build_random_question number_of_goods: 5, duration: 300
    question5.instruction = Instruction.find_by_number(3)
    #question3.display_formula = true (taking out the formulas)
    question5.save

    logger.info 'Generating question 6'
    question6 = build_random_question number_of_goods: 5, duration: 300
    question6.instruction = Instruction.find_by_number(3)
    #question3.display_formula = true (taking out the formulas)
    question6.save
    
    logger.info 'Generating question 7'
    question7 = build_random_question number_of_goods: 3, duration: BetaRandom.get_seconds
    question7.instruction = Instruction.find_by_number(4)
    question7.display_timer = false
    #question4.display_formula = true
    question7.save
    
    logger.info 'Generating question 8'
    question8 = build_random_question number_of_goods: 3, duration: BetaRandom.get_seconds
    question8.instruction = Instruction.find_by_number(4)
    question8.display_timer = false
    #question4.display_formula = true
    question8.save
    
    logger.info 'Generating question 9'
    question9 = build_random_question number_of_goods: 4, duration: BetaRandom.get_seconds
    question9.instruction = Instruction.find_by_number(5)
    question9.display_timer = false
    question9.save
    
    logger.info 'Generating question 10'
    question10 = build_random_question number_of_goods: 4, duration: BetaRandom.get_seconds
    question10.instruction = Instruction.find_by_number(5)
    question10.display_timer = false
    question10.save
    
    logger.info 'Generating question 11'
    question11 = build_random_question number_of_goods: 5, duration: BetaRandom.get_seconds
    question11.instruction = Instruction.find_by_number(6)
    question11.display_timer = false
    question11.save
    
    logger.info 'Generating question 12'
    question12 = build_random_question number_of_goods: 5, duration: BetaRandom.get_seconds
    question12.instruction = Instruction.find_by_number(6)
    question12.display_timer = false
    question12.save
    
    logger.info 'Choosing random question as the question that is judged'
    random_question_id = scorable_questions.sample.id
    update_column :chosen_question_id, random_question_id 
    
    shuffle_scorable_questions
  end
  
  def shuffle_scorable_questions
    shuffled = scorable_questions.shuffle
    
    parent = current_question
    shuffled.each do |question|
      question.previous_question = parent
      question.save!
      parent = question
    end
  end
 
  # params
  # number_of_goods: number of goods for the question to generate
  # duration: duration in seconds
  # previous_question: the previous question (default is nil)
  def build_random_question(params = {})
    # default values
    params[:previous_question] ||= nil
    params[:duration]          ||= 600
    
    # build and return the question
    question = Question.generate_random(params.slice(:number_of_goods))
    question.user = self
    question.duration = params[:duration]
    question
  end
  
end
