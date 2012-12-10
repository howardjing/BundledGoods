class CreateQuestionStats < ActiveRecord::Migration
  def change
    create_table :question_stats do |t|
      t.references :question, null: false
      t.text :content
      t.timestamps
    end
    add_index :question_stats, :question_id
  end
end
