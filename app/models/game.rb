class Game < ActiveRecord::Base

  has_many :teams, :through => :registrations
  has_many :registrations

  def register(team)
    teams << team
  end

  def unregister(team)
    teams.delete(team)
  end
end
