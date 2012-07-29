class AddTimestampToAnswers < ActiveRecord::Migration
  def up
    change_table :answers do |t| 
      t.datetime :created_at
      t.datetime :updated_at
    end

    change_table :responses do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def down
    remove_column :answers, :created_at
    remove_column :answers, :updated_at

    remove_column :responses, :created_at
    remove_column :responses, :updated_at
  end
end

