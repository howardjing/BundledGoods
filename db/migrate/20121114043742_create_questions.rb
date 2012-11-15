class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id
      t.integer :previous_question_id
      t.integer :duration
      t.datetime :time_started
      t.text :values
      t.text :effects

      t.timestamps
    end
    
    add_index :questions, :user_id
    
  end
end
