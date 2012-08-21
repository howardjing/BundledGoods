class ChangeUtilityToFloat < ActiveRecord::Migration
  def change
    remove_column :goods, :utility
    add_column :goods, :utility, :float
  end
end
