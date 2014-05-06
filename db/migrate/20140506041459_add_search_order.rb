class AddSearchOrder < ActiveRecord::Migration
  def up
    add_column :questions, :search_order, :string
  end

  def down
    remove_column :questions, :search_order
  end
end
