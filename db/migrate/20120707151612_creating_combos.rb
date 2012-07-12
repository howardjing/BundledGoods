class CreatingCombos < ActiveRecord::Migration
  def change
    create_table :combos do |t|
      t.references :question
      t.float :price
      t.float :lambda
      t.float :utility
      t.float :value
    end
  end
end
