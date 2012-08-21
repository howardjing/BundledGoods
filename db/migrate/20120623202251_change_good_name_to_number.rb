class ChangeGoodNameToNumber < ActiveRecord::Migration
  def change
    remove_column :goods, :name
    add_column :goods, :number, :integer
  end
end
