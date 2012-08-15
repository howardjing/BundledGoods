class ChangingTiming < ActiveRecord::Migration
  def change
    rename_column :questions, :timed, :random_duration
    add_column :questions, :duration, :integer
  end
end
