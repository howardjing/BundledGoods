class AddMiscToResponses < ActiveRecord::Migration
  def change
    add_column :responses, :misc, :text
  end
end
