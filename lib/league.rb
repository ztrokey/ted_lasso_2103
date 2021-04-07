class League
  attr_reader :name, :teams
  def initialize(name)
    @name = name
    @teams = []
  end

  def add_team(team)
    @teams.push(team)
  end

  def captains
    #this is wrong
    captains = []
    captains.push(@teams.team.captain)
  end
end
