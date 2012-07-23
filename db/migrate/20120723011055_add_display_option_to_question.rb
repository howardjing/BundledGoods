class AddDisplayOptionToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :display_equation, :boolean, :default => false
  end
end
