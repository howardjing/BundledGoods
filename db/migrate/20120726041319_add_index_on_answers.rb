class AddIndexOnAnswers < ActiveRecord::Migration
  def change
    add_index :answers, :name
  end
  
end
