class CreateBundlesTable < ActiveRecord::Migration
  def change
    create_table :bundles do |t|
      t.string :name
      t.float :lambda
    end

    create_table :bundles_goods do |t|
      t.references :bundle
      t.references :good
    end
  end
end
