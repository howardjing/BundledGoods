class RemoveLimitFromIntegers < ActiveRecord::Migration
  def change
    change_column :bundles, :number, :integer, :limit => nil
    change_column :goods, :number, :integer, :limit => nil
  end
end
