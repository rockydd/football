class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :name
      t.integer :capacity
      t.integer :creator_id
      t.integer :admin_id
      t.string :game_type
      t.string :status
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
