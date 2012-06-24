class ChangeGoodNameToNumber < ActiveRecord::Migration
  def change
    rename_column :goods, :name, :number
    change_column :goods, :number, :integer
  end
end
