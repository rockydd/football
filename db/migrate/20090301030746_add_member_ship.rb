class AddMemberShip < ActiveRecord::Migration
  def self.up
    create_table( :membership,:id=>false) do |t|
      t.column :member_id,:integer,:not_null=>true
      t.column :team_id,:integer,:not_null=>true
      t.timestamp
    end
  end

  def self.down
    drop_table :membership
  end
end
