class UpdateUserAttributes < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :name
      t.string :lab_number
      t.integer :age
      t.string :class
      t.string :major
      t.string :gender
    end
  end
end
