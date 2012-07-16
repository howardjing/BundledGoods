class CreateTableExplanations < ActiveRecord::Migration
  def change
    create_table :explanations do |t|
      t.integer :question_id
      t.integer :user_id
      t.string :content
    end
    add_index :explanations, :content
  end
end
