class CreateRegistrations < ActiveRecord::Migration
  def self.up
    create_table :registrations,:id=>false do |t|
      t.integer :game_id
      t.integer :team_id

      t.timestamps
    end
  end

  def self.down
    drop_table :registrations
  end
end
