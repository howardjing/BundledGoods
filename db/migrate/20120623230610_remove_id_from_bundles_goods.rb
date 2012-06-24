class RemoveIdFromBundlesGoods < ActiveRecord::Migration
  def change
    remove_column :bundles_goods, :id
  end
end
