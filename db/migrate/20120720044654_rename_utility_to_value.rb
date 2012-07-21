class RenameUtilityToValue < ActiveRecord::Migration
  def change
    rename_column :goods, :utility, :value
  end
end
