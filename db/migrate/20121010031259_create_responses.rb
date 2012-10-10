class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.string :ip_address, :null => false
      t.string :user_agent, :null => false
      t.string :who, :null => false

      t.timestamps
    end
  end
end
