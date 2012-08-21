class ChangeBundleNameToNumber < ActiveRecord::Migration
  def change
    remove_column :bundles, :name
    add_column :bundles, :number, :integer
  end
end
