class AddInstructionsToSurvey < ActiveRecord::Migration
  def change
    add_column :surveys, :instructions, :text

  end
end
