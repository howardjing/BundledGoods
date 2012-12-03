class AddChosenQuestionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :chosen_question_id, :integer
  end
end
