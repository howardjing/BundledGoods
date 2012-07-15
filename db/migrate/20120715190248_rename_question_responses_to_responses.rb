class RenameQuestionResponsesToResponses < ActiveRecord::Migration
  def change
    rename_table :question_responses, :responses
  end
end
