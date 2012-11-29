class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.text :content
      t.integer :number

      t.timestamps
    end
    add_index :instructions, :number, unique: true
  end
end
