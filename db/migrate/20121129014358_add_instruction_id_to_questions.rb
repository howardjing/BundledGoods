class AddInstructionIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :instruction_id, :integer, null: false
    add_index :questions, :instruction_id
  end
end
