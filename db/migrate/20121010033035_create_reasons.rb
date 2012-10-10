class CreateReasons < ActiveRecord::Migration
  def change
    create_table :reasons do |t|
      t.text :why, :null => false
      t.text :critique, :null => false
      t.integer :response_id, :null => false

      t.timestamps
    end
  end
end
