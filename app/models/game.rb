class Game < ActiveRecord::Base

  has_and_belongs_to_many :teams, :join_table=> 'registrations'
  has_many :registrations

  def register(team)
    teams << team
  end

  def unregister(team)
    teams.delete(team)
  end
end
