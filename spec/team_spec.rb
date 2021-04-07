# * The team captain is the highest paid player.

# pry(main)> roy = Player.new({name: "Roy Kent", position: "Center Midfielder" , salary: 1_000_000})
# # => #<Player:0x00007f98a4ba8dc8...>
#
# pry(main)> sam = Player.new({name: "Sam Obisanya", position: "Right-back Defender", salary: 600_000})
# # => #<Player:0x00007f8327213de0...>
#
# pry(main)> richmond = Team.new("AFC Richmond", "Ted Lasso", [roy, sam])
# # => #<Team:0x00007f83280b3288...>
#
# pry(main)> richmond.name
# # => "AFC Richmond"
#
# pry(main)> richmond.coach
# # => "Ted Lasso"
#
# pry(main)> richmond.players
# # => [#<Player:0x00007f8327213de0...>, #<Player:0x00007f8326ab57d8...>]
#
# pry(main)> richmond.total_salary
# # => 1600000
#
# pry(main)> richmond.captain
# # => "Roy Kent"
#
# pry(main)> richmond.positions_filled
# # => ["Center Midfielder", "Right-back Defender"]
# ```
require 'rspec'
require './lib/player'
require './lib/team'
