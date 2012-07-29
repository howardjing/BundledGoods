class AddTimedToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :timed, :boolean, :default => false
  end
end
