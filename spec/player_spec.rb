# Use TDD to create a `Player` class that responds to the following interaction pattern:
#
# ```ruby
# pry(main)> require './lib/player'
# # => true
#
# pry(main)> roy = Player.new({name: "Roy Kent", position: "Center Midfielder", salary: 1_000_000})
# # => #<Player:0x00007f98a4ba8dc8...>
#
# pry(main)> roy.name
# # => "Roy Kent"
#
# pry(main)> roy.position
# # => "Center Midfielder"
#
# pry(main)> roy.salary
# # => 1000000
require './lib/player'
