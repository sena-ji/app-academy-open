require_relative "ghost.rb"

print "Enter names of players with spaces in between like 'Max Sophia Alex': "
player_names = gets.chomp.split(' ').to_a

player_instances = player_names.map { |player| Player.new(player) }

game = GhostGame.new(player_instances)
game.run