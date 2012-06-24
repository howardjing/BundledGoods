class ChangeBundleNameToNumber < ActiveRecord::Migration
  def change
    change_column :bundles, :name, :integer
    rename_column :bundles, :name, :number
  end
end
