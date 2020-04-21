require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Ryuja")
player2 = Player.new("Despi")

while player1.life_points > 0 || player2.life_points > 0
puts "-----------------------------------------------------------"
puts "Voici l'état de chaque joueur :"
puts "#{player1.name} : #{player1.life_points} points de vie."
puts "#{player2.name} : #{player2.life_points} points de vie."
puts
puts "Passons à la phase d'attaque :"
player1.attacks(player2)
break if player2.life_points < 1 
player2.attacks(player1)
break if player1.life_points < 1 
end