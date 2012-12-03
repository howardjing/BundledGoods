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

  private
  
  # there are many things wrong with this method
  def generate_questions
    logger.info 'Generating demo question...'
    demo = build_random_question number_of_goods: 3, duration: 600
    demo.instruction = Instruction.find_by_number(0)
    demo.save
    
    logger.info 'Assigning demo question to users current_question'
    update_column(:current_question_id, demo.id)
    
    logger.info 'Generating question 1'
    question1 = build_random_question number_of_goods: 4, duration: 900, previous_question: demo
    question1.instruction = Instruction.find_by_number(1)
    question1.save

    logger.info 'Generating question 2'
    question2 = build_random_question number_of_goods: 5, duration: 1200, previous_question: question1
    question2.instruction = Instruction.find_by_number(2)
    question2.save
    
    logger.info 'Generating question 3'
    question3 = build_random_question number_of_goods: 4, duration: 900, previous_question: question2
    question3.instruction = Instruction.find_by_number(3)
    question3.display_formula = true
    question3.save
    
    logger.info 'Generating question 4'
    question4 = build_random_question number_of_goods: 5, duration: 1200, previous_question: question3
    question4.instruction = Instruction.find_by_number(4)
    question4.display_formula = true
    question4.save
    
    logger.info 'Generating question 5'
    question5 = build_random_question number_of_goods: 4, duration: BetaRandom.get_seconds, previous_question: question4
    question5.instruction = Instruction.find_by_number(5)
    question5.display_timer = false
    question5.save
    
    logger.info 'Generating question 6'
    question6 = build_random_question number_of_goods: 5, duration: BetaRandom.get_seconds, previous_question: question5
    question6.instruction = Instruction.find_by_number(6)
    question6.display_timer = false
    question6.save
    
    logger.info 'Choosing random question as the question that is judged'
    valid_questions = [question1, question2, question3, question4, question5, question6]
    logger.info "shuffling question ids: #{valid_questions.map(&:id)}"
    random_question_id = valid_questions.shuffle.first.id
    logger.info "Choosing question with id #{random_question_id}"
    update_column :chosen_question_id, random_question_id 
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
    question.previous_question = params[:previous_question]
    question.duration = params[:duration]
    question
  end
  
end
