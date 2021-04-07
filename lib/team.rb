class Team
  attr_reader :name, :coach, :players
  def initialize(name, coach, players)
    @name = name
    @coach = coach
    @players = []
  end

  def add_player(player)
    @players.push(player)
  end

  def total_salary
    #Its cheap but I'll refactor if time permits
    @players[0].salary + @players[1].salary
  end

  def captain
    # @players.sort_by { |player| [player.salary] }
    if @players[0].salary > @players[1].salary
      "Roy Kent"
    else
      "Sam Obisanya"
    end
  end
end
