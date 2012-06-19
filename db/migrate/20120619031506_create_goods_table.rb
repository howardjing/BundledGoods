class CreateGoodsTable < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :name
      t.float :price
    end
  end
end
