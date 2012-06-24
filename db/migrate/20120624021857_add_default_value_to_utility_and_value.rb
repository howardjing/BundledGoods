class AddDefaultValueToUtilityAndValue < ActiveRecord::Migration
  def change
    change_column :bundles, :lambda, :float, :default => 1.0
    change_column :bundles, :value, :float, :default => 0.0
    change_column :bundles, :utility, :float, :default => 0.0

    change_column :goods, :price, :float, :default => 1.0
  end
end
