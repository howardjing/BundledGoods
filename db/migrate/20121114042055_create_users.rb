class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :lab_number
      t.integer :age
      t.integer :current_question_id
      t.string :year
      t.string :major
      t.string :gender

      t.timestamps
    end
  end
end
