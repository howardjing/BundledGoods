require 'test_helper'
require 'test_helpers/question_test_helper'
class QuestionTest < ActiveSupport::TestCase

  test ".generate_random generates the correct number of goods" do
    quest = Question.generate_random(number_of_goods: 5)
    assert_equal quest.values.length, 5
    assert_equal quest.effects.length, correct_number_of_combos(5)
  end
  
  test ".generate_random generates the correct range of values" do
    quest = Question.generate_random(value_range: [599,602], effect_range: [-200,-195])
    quest.values.each do |key, value|
      assert (599..602).include?(value)
    end
    quest.effects.each do |key, value|
      assert (-200..-195).include?(value)
    end
  end
  
end
