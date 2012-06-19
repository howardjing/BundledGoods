class CreateQuestionResponses < ActiveRecord::Migration
  def change
    create_table :question_responses do |t|
      t.integer :question_id
      t.text :content
      t.timestamps
    end
  end
end
