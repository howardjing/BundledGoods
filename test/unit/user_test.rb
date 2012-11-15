require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  # must assign user, duration, and number of goods
  test "#build_random_question assigns the parameters correctly" do
    user = User.new
    question = user.send :build_random_question, { number_of_goods: 3, duration: 100 }
    assert_equal question.user, user
    assert_equal question.values.length, 3
    assert_equal question.duration, 100
  end
end
