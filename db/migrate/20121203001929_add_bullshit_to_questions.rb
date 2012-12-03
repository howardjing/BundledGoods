class AddBullshitToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :display_timer, :boolean, default: true
    add_column :questions, :display_formula, :boolean, default: false
  end
end
