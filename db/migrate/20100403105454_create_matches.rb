class CreateMatches < ActiveRecord::Migration
  def self.up
    create_table :matches do |t|
      t.string :name
      t.integer :white_goalkeeper_id, :white_attacker_id, :red_goalkeeper_id, :red_attacker_id
      t.datetime :start_time, :end_time
      t.timestamps
    end
  end

  def self.down
    drop_table :matches
  end
end
