class AddIndexToQuestionResponses < ActiveRecord::Migration
  def change
    add_index :question_responses, :content
  end
end
