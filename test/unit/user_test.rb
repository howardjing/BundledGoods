require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :instructions
  
  # must assign user, duration, and number of goods
  test "#build_random_question assigns the parameters correctly" do
    user = User.new
    question = user.send :build_random_question, { number_of_goods: 3, duration: 100 }
    assert_equal question.user, user
    assert_equal question.values.length, 3
    assert_equal question.duration, 100
  end
  
  # make sure that the chosen_question was not the demo question but the current_question is the demo question
  test "#generate_questions" do
    100.times do |i|
      user = User.new
      user.lab_number = i
      user.save
      assert_equal false, user.chosen_question.demo? 
      assert_equal true, user.current_question.demo?
    end
  end
end
