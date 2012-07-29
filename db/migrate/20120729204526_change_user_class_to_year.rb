class ChangeUserClassToYear < ActiveRecord::Migration
  def change
    rename_column :users, :class, :year
  end

end
