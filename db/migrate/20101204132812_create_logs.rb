class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.text :message
      t.integer :server_id
      t.timestamps
    end
  end
end
