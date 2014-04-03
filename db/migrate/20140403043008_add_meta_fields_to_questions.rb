class AddMetaFieldsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :increasing, :boolean
    add_column :questions, :notes, :text
  end
end
