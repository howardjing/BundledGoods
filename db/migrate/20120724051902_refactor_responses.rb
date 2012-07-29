class RefactorResponses < ActiveRecord::Migration
  def change
    drop_table :responses
    
    create_table :responses do |t|
      t.integer :duration
      t.integer :question_id
      t.integer :user_id
      t.datetime :end_time
    end
    
    create_table :answers do |t|
      t.integer :responses_id
      t.boolean :selected
      t.string :name
    end
  end
end
