class AddValueAndUtilityToBundles < ActiveRecord::Migration
  def change
    add_column :bundles, :value, :float
    add_column :bundles, :utility, :float
  end
end
