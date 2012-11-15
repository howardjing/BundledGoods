def factorial(n)
 if n == 0
   1
 else
   (1..n).inject(:*)
 end
end

def combinatorial(n,r)
 factorial(n) / (factorial(r) * factorial(n - r))
end

def correct_number_of_combos(n)
 (2..5).to_a.map { |r| combinatorial(n, r) }.inject(0, :+)
end

class QuestionTestHelperTest < ActiveSupport::TestCase
  test "factorial works correctly" do
    assert_equal factorial(5), 120
  end
  
  test "combinatorial works correctly" do
    assert_equal combinatorial(5, 2), 10
  end
  
  test "correct_number_of_combos works correctly" do
    assert_equal correct_number_of_combos(5), 26
  end
end
