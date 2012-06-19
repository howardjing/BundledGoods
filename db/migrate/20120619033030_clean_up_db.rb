class CleanUpDb < ActiveRecord::Migration
  def change 
    add_column :goods, :question_id, :integer
    add_column :goods, :utility, :text
    add_column :question_responses, :user_id, :integer
  end
end
