class AddQuestionReferenceToBundles < ActiveRecord::Migration
  def change
    add_column :bundles, :question_id, :integer
  end
end
