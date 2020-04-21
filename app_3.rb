require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "     Bienvenue sur le meilleur jeu du moment     "
puts "               'TSN Battle Royale'               "
puts " Le but du jeu est d'être le dernier survivant ! "
puts "-------------------------------------------------"

puts "Insérez votre pseudo ici :"
print "> "
username = gets.chomp

my_game = Game.new(username)

while my_game.is_still_ongoing?
  my_game.show_players
  my_game.menu
  my_game.menu_choice
  my_game.enemies_attack
end

my_game.end
