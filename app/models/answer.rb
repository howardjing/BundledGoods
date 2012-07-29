class Answer < ActiveRecord::Base

  belongs_to :response

  def combo?
    !name.index("Combo").nil?
  end

  def good?
    !name.index("Good").nil?
  end

  # the corresponding good that this answer is associated with
  # (only makes sense if this answer is a good)
  def good
    raise "not a good" if !good?
    # The last char of the answer's name is the good number
    good_number = name.last.to_i
    response.question.goods.find_by_number good_number
  end

  # compares the currentness of this answer with another answer
  def more_current?(answer)
    self.created_at > answer.created_at
  end
end
