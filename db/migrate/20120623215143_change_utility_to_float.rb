class ChangeUtilityToFloat < ActiveRecord::Migration
  def change
    change_column :goods, :utility, :float
  end
end
