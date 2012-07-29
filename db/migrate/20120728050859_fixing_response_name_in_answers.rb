class FixingResponseNameInAnswers < ActiveRecord::Migration
  def change
    rename_column :answers, :responses_id, :response_id
  end
end
